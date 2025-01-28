from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from database import get_db
import models, schemas

s_pembayaran_router = APIRouter(prefix='/pembayaranakhir', tags=['pembayaranakhir'])

@s_pembayaran_router.post("/konfirmasiPembayaran/", response_model=schemas.PembayaranAkhir)
def konfirmasi_pembayaran(pembayaran: schemas.PembayaranAkhirCreate, db: Session = Depends(get_db)):
    db_pembayaran = models.PembayaranAkhir(**pembayaran.dict())
    db.add(db_pembayaran)
    db.commit()
    db.refresh(db_pembayaran)
    return db_pembayaran
