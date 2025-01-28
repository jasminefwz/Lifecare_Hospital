from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from database import get_db
from schemas import KonfirmasiPembayaranCreate
from models import PembayaranAkhir

pembayaran_router = APIRouter(prefix='/pembayaran', tags=['pembayaran'])

@pembayaran_router.post("/konfirmasi_pembayaran")
async def konfirmasi_pembayaran(konfirmasi_pembayaran: KonfirmasiPembayaranCreate, db: Session = Depends(get_db)):
    # Check if the payment exists
    pembayaran = db.query(PembayaranAkhir).filter(PembayaranAkhir.id_pembayaran == konfirmasi_pembayaran.id_pembayaran).first()
    if not pembayaran:
        raise HTTPException(status_code=404, detail="Pembayaran tidak ditemukan")

    # Update payment method and status
    pembayaran.id_metode_pembayaran = konfirmasi_pembayaran.id_metode_pembayaran
    pembayaran.id_status_pa = konfirmasi_pembayaran.id_status_pa
    db.commit()

    return {"message": "Konfirmasi pembayaran berhasil"}
