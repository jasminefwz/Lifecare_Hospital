from fastapi import APIRouter, Depends, HTTPException, File, UploadFile, Form
from sqlalchemy.orm import Session
import os
from fastapi.responses import FileResponse
from database import get_db
from schemas import *
from dependencies import *
from models import *

profil_router = APIRouter(prefix='/profil', tags=['profil'])
@profil_router.get("/user", response_model=UserResponse)
def get_user_logged_in(current_user: User = Depends(get_current_user)):
    return current_user

@profil_router.put('/user', response_model=UserResponseData)
async def update_user_profile(user_update: UserUpdateRequest, current_user: User = Depends(get_current_user), db: Session = Depends(get_db)):
    user = db.query(User).filter(User.id_user == current_user.id_user).first()
    
    if user is None:
        raise HTTPException(status_code=404, detail="User not found")

    # Update user fields
    if user_update.nama_user is not None:
        user.nama_user = user_update.nama_user
    if user_update.nik_user is not None:
        user.nik_user = user_update.nik_user
    if user_update.tmpt_lahir_user is not None:
        user.tmpt_lahir_user = user_update.tmpt_lahir_user
    if user_update.tl_user is not None:
        user.tl_user = user_update.tl_user
    if user_update.jk_user is not None:
        user.jk_user = user_update.jk_user
    if user_update.alamat_user is not None:
        user.alamat_user = user_update.alamat_user
    if user_update.telp_user is not None:
        user.telp_user = user_update.telp_user
    if user_update.email_user is not None:
        user.email_user = user_update.email_user

    db.commit()
    db.refresh(user)

    return user