from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import List
from database import get_db
from dependencies import *
from models import *
from schemas import *

medcek_router = APIRouter(prefix='/medcek', tags=['medcek'])

@medcek_router.get("/getallmedcek", response_model=List[MedCek])
def get_all_medcek(db: Session = Depends(get_db)):
    return db.query(MedCekk).all()

@medcek_router.get("/getmedcek", response_model=List[MedCekSimple])
def get_medcek(db: Session = Depends(get_db)):
    return db.query(MedCekk).all()

@medcek_router.get("/getmedcekbyid/{id_medcek}", response_model=MedCek)
def get_medcek_by_id(id_medcek: int, db: Session = Depends(get_db)):
    medcek = db.query(MedCekk).filter(MedCekk.id_medcek == id_medcek).first()
    if medcek is None:
        raise HTTPException(status_code=404, detail="MedCek not found")
    return medcek

@medcek_router.get("/searchmedcek", response_model=List[MedCekSimple])
def search_medcek(nama_medcek: str, db: Session = Depends(get_db)):
    return db.query(MedCekk).filter(MedCekk.nama_medcek.contains(nama_medcek)).all()