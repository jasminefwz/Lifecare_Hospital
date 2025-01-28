from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
import os
from fastapi.responses import FileResponse
from database import get_db
from schemas import *
from dependencies import *
from models import *

jt_router = APIRouter(prefix='/janjitemu', tags=['janjitemu'])
@jt_router.get("/user", response_model=UserResponse)
def get_user_logged_in(current_user: User = Depends(get_current_user)):
    return current_user

@jt_router.get("/allusers", response_model=list[UserResponse])
def get_all_users(db: Session = Depends(get_db)):
    users = db.query(User).all()
    return users

@jt_router.post("/tambahpasien", response_model=PasienResponse)
def tambah_pasien(pasien: PasienCreate, db: Session = Depends(get_db)):
    new_pasien = Pasien(
        nama_pasien=pasien.nama_pasien,
        nik_pasien=pasien.nik_pasien,
        tmpt_lahir_pasien=pasien.tmpt_lahir_pasien,
        tl_pasien=pasien.tl_pasien,
        jk_pasien=pasien.jk_pasien,
        alamat_pasien=pasien.alamat_pasien,
        telp_pasien=pasien.telp_pasien,
        nama_pemesan=pasien.nama_pemesan,
        telp_pemesan=pasien.telp_pemesan
    )
    db.add(new_pasien)
    db.commit()
    db.refresh(new_pasien)
    return new_pasien

@jt_router.get("/pasien/{id_pasien}", response_model=PasienResponse)
def get_pasien(id_pasien: int, db: Session = Depends(get_db)):
    pasien = db.query(Pasien).filter(Pasien.id_pasien == id_pasien).first()
    if not pasien:
        raise HTTPException(status_code=404, detail="Pasien not found")
    return pasien

@jt_router.get("/allpasien", response_model=list[PasienResponse])
def get_all_pasien(db: Session = Depends(get_db)):
    pasiens = db.query(Pasien).all()
    return pasiens

# @jt_router.post("/tambahpasien", response_model=Pasien)
# def create_pasien_endpoint(pasien: PasienCreate, db: Session = Depends(get_db)):
#     try:
#         db_pasien = Pasien(**pasien.dict())
#         db.add(db_pasien)
#         db.commit()
#         db.refresh(db_pasien)
#         return db_pasien
#     except Exception as e:
#         logger.error(f"Error creating pasien: {e}")
#         raise HTTPException(status_code=500, detail="An error occurred while creating the pasien")


# @jt_router.get("/getdatadiri{id_pasien}", response_model=Pasien)
# def get_pasien_endpoint(id_pasien: int, db: Session = Depends(get_db)):
#     try:
#         db_pasien = db.query(Pasien).filter(Pasien.id_pasien == id_pasien).first()
#         if db_pasien is None:
#             raise HTTPException(status_code=404, detail="Pasien not found")
#         return db_pasien
#     except Exception as e:
#         logger.error(f"Error retrieving pasien: {e}")
#         raise HTTPException(status_code=500, detail="An error occurred while retrieving the pasien")