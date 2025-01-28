from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
from jose import jwt
from datetime import datetime
from models import User, Token
from schemas import *
from database import get_db
from dependencies import *

auth_router = APIRouter(prefix="/auth", tags=["auth"])

@auth_router.post("/register/")
async def register(request: UserCreate, db: Session = Depends(get_db)):
    hashed_password = get_hashed_password(request.pass_user)
    
    db_user = db.query(User).filter(User.username == request.username).first()
    
    if db_user:
        raise HTTPException(status_code=400, detail="Username sudah terdaftar")
    
    new_user = User(
        username=request.username,
        pass_user=hashed_password,
        nama_user=request.nama_user,  # Ensure this field is provided
        nik_user=request.nik_user,    # Ensure this field is provided
        tmpt_lahir_user=request.tmpt_lahir_user,  # Ensure this field is provided
        tl_user=request.tl_user,      # Ensure this field is provided
        jk_user=request.jk_user,      # Ensure this field is provided
        alamat_user=request.alamat_user,  # Ensure this field is provided
        telp_user=request.telp_user,  # Ensure this field is provided
        email_user=request.email_user # Ensure this field is provided
    )
    
    db.add(new_user)
    db.commit()
    db.refresh(new_user)

    response_data = UserResponseData(id=new_user.id_user, username=new_user.username, id_user=new_user.id_user, nama=new_user.nama_user, nik=new_user.nik_user, tmpt=new_user.tmpt_lahir_user, tl=new_user.tl_user, jk=new_user.jk_user, telp=new_user.telp_user, email=new_user.email_user)
    return ResponseBase(message="User registered successfully", data=response_data, error=False)

@auth_router.post('/login')
def login(request: UserLogin, db: Session = Depends(get_db)):
    user = db.query(User).filter(User.username == request.username).first()
    if user is None:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="Incorrect username")
    hashed_pass = user.pass_user
    if not verify_password(request.password, hashed_pass):
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="Incorrect password")
    
    access = create_access_token(user.id_user)
    refresh = create_refresh_token(user.id_user)

    token_db = Token(user_id=user.id_user, access_token=access, refresh_token=refresh, status=True)
    db.add(token_db)
    db.commit()
    db.refresh(token_db)
    response_data = TokenResponseData(access_token=access, refresh_token=refresh, id_user=user.id_user)
    return ResponseBase(message="Success login", data=response_data, error=False)

@auth_router.get('/getusers')
def getusers(session: Session = Depends(get_db), token: str = Depends(JWTBearer())):
    users = session.query(User).all()
    response_data = [UserListResponseData(id=user.id_user, username=user.username) for user in users]
    return ResponseBase(message="Users retrieved successfully", data=response_data, error=False)

@auth_router.post('/change-password')
def change_password(request: changepassword, db: Session = Depends(get_db)):
    user = db.query(User).filter(User.username == request.username).first()
    if user is None:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="User not found")
    
    if not verify_password(request.old_password, user.pass_user):
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="Invalid old password")
    
    encrypted_password = get_hashed_password(request.new_password)
    user.pass_user = encrypted_password
    db.commit()
    
    return ResponseBase(message="Password changed successfully", data=None, error=False)

@auth_router.post('/logout')
def logout(token: str = Depends(JWTBearer()), db: Session = Depends(get_db)):
    payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
    user_id = payload['sub']
    token_record = db.query(Token).all()
    info = []
    for record in token_record:
        if (datetime.utcnow() - record.created_date).days > 1:
            info.append(record.user_id)
    if info:
        db.query(Token).filter(Token.user_id.in_(info)).delete()
        db.commit()
        
    existing_token = db.query(Token).filter(Token.user_id == user_id, Token.access_token == token).first()
    if existing_token:
        existing_token.status = False
        db.add(existing_token)
        db.commit()
        db.refresh(existing_token)
    return ResponseBase(message="Logout Successfully", data=None, error=False)

@auth_router.get('/get-user-name')
def get_user_name(session: Session = Depends(get_db), token: str = Depends(JWTBearer())):
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        user_id = payload.get("sub")
        
        if not user_id:
            raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid token or user ID not found in token")

        user = session.query(User).filter(User.id_user == user_id).first()

        if not user:
            raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="User not found")
        
        response_data = user.nama_user
        return ResponseBase(message="User name retrieved successfully", data=response_data, error=False)
    
    except jwt.JWTError:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Token validation failed")
    
    
    