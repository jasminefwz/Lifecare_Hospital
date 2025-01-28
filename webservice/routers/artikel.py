from fastapi import APIRouter, Depends, HTTPException, File, UploadFile, Form
from sqlalchemy.orm import Session
import os
from typing import List
from fastapi.responses import FileResponse
from database import get_db
from schemas import *
from dependencies import *
from models import *

artikel_router = APIRouter(prefix='/artikels', tags=['artikels'])

@artikel_router.get('/getall')
async def get_artikels(db: Session = Depends(get_db)):
    artikels = db.query(Artikel).all()
    return {
        "message": "Artikel berhasil diambil",
        "artikels": artikels,
    }

@artikel_router.get("/getartikel", response_model=List[ArtikelAwal])
def get_all_artikel(db: Session = Depends(get_db)):
    return db.query(Artikel).all()

@artikel_router.get('/getby{id}', response_model=dict)
async def get_artikel_by_id(id_artikel: int, db: Session = Depends(get_db)):
    artikel = db.query(Artikel).filter(Artikel.id_artikel == id_artikel).first()
    if artikel is None:
        raise HTTPException(status_code=404, detail="Artikel tidak ditemukan")

    response = ArtikelResponseData(
        id_artikel= artikel.id_artikel,
        judul_artikel= artikel.judul_artikel,
        isi_artikel= artikel.isi_artikel,
        foto_artikel= artikel.foto_artikel
    )

    return {
        "message": "Artikel berhasil diambil",
        "artikel": response
    }