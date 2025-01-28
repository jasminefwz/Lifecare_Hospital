
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from sqlalchemy import func
from typing import List
import models, schemas
from database import SessionLocal

invoice_router = APIRouter(prefix="/invoice",
    tags=["invoice"],)

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

def generate_no_antrian(db: Session):
    last_no_antrian = db.query(func.max(models.Invoice.no_antrian)).scalar()
    if last_no_antrian is not None:
        return last_no_antrian + 1
    return 1

def generate_no_invoice(db: Session):
    last_invoice = db.query(func.max(models.Invoice.no_invoice)).scalar()
    if last_invoice:
        return f'INV{int(last_invoice[3:]) + 1:06d}'
    return 'INV000001'

@invoice_router.post("/invoices/", response_model=schemas.Invoice)
def create_invoice(invoice: schemas.InvoiceCreate, db: Session = Depends(get_db)):
    # Generate no_antrian and no_invoice
    no_antrian = generate_no_antrian(db)
    no_invoice = generate_no_invoice(db)
    
    db_invoice = models.Invoice(
        no_antrian=no_antrian,
        no_invoice=no_invoice,
        tgl_invoice=invoice.tgl_invoice,
        waktu_invoice=invoice.waktu_invoice,
        id_dokter_i=invoice.id_dokter_i,
        id_pasien_i=invoice.id_pasien_i,
        id_status_checkin=invoice.id_status_checkin
    )
    
    db.add(db_invoice)
    db.commit()
    db.refresh(db_invoice)
    return db_invoice

@invoice_router.get("/patients/{id_pasien}/history", response_model=List[schemas.PatientHistory])
def get_patient_history(id_pasien: int, db: Session = Depends(get_db)):
    history = db.query(models.Invoice).filter(models.Invoice.id_pasien_i == id_pasien).all()
    if not history:
        raise HTTPException(status_code=404, detail="No history found for this patient")
    return history

@invoice_router.get("/searchdokterspesialis", response_model=List[schemas.DokterSpesialisSearch])
def search_dokter_spesialis(query: str, db: Session = Depends(get_db)):
    search_query = f"%{query}%"
    results = db.query(models.Dokter).join(models.Spesialis).filter(
        (models.Dokter.nama_dokter.ilike(search_query)) |
        (models.Spesialis.nama_spesialis.ilike(search_query))
    ).all()
    
    if not results:
        raise HTTPException(status_code=404, detail="No doctors or specialists found matching the query")
    
    return results
