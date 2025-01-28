from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session, joinedload
from typing import List
import models, schemas
from database import get_db

rekammedis_router = APIRouter(
    prefix="/rekam_medis",
    tags=["rekam_medis"],
)

@rekammedis_router.get("/getpasienrm", response_model=List[schemas.PilihPasien])
def get_pasien_rm(db: Session = Depends(get_db)):
    invoices = db.query(models.Invoice).options(
        joinedload(models.Invoice.pasien)
    ).all()

    response = []
    for invoice in invoices:
        if invoice.pasien:
            response.append({
                "id_pasien": invoice.pasien.id_pasien,
                "nama_pasien": invoice.pasien.nama_pasien,
                "tl_pasien": invoice.pasien.tl_pasien,
                "jk_pasien": invoice.pasien.jk_pasien
            })

    return response

@rekammedis_router.get("/getall", response_model=List[schemas.RekamMedis])
def get_rekam_medis(db: Session = Depends(get_db)):
    rekam_medis = db.query(models.RekamMedis).options(
        joinedload(models.RekamMedis.invoice).joinedload(models.Invoice.pasien),
        joinedload(models.RekamMedis.invoice).joinedload(models.Invoice.dokter).joinedload(models.Dokter.spesialis)
    ).all()

    # Create the response manually to ensure nested data is included
    response = []
    for rm in rekam_medis:
        response.append({
            "id_rekammedis": rm.id_rekammedis,
            "id_invoice": rm.id_invoice,
            "bb_pasien": rm.bb_pasien,
            "tekanan_darah": rm.tekanan_darah,
            "hasil_diagnosa": rm.hasil_diagnosa,
            "resep_obat": rm.resep_obat,
            "id_status_bayar_akhir": rm.id_status_bayar_akhir,
            "pasien": {
                "nama_pasien": rm.invoice.pasien.nama_pasien,
                "tl_pasien": rm.invoice.pasien.tl_pasien,
                "jk_pasien": rm.invoice.pasien.jk_pasien
            },
            "dokter": {
                "nama_dokter": rm.invoice.dokter.nama_dokter,
                "spesialis": {
                    "nama_spesialis": rm.invoice.dokter.spesialis.nama_spesialis
                }
            }
        })

    return response

@rekammedis_router.get("/{rekam_medis_id}", response_model=schemas.RekamMedis)
def get_rekam_medis_by_id(rekam_medis_id: int, db: Session = Depends(get_db)):
    rm = db.query(models.RekamMedis).options(
        joinedload(models.RekamMedis.invoice).joinedload(models.Invoice.pasien),
        joinedload(models.RekamMedis.invoice).joinedload(models.Invoice.dokter).joinedload(models.Dokter.spesialis)
    ).filter(models.RekamMedis.id_rekammedis == rekam_medis_id).first()
    
    response = {
        "id_rekammedis": rm.id_rekammedis,
        "id_invoice": rm.id_invoice,
        "bb_pasien": rm.bb_pasien,
        "tekanan_darah": rm.tekanan_darah,
        "hasil_diagnosa": rm.hasil_diagnosa,
        "resep_obat": rm.resep_obat,
        "id_status_bayar_akhir": rm.id_status_bayar_akhir,
        "pasien": {
                "nama_pasien": rm.invoice.pasien.nama_pasien,
                "tl_pasien": rm.invoice.pasien.tl_pasien,
                "jk_pasien": rm.invoice.pasien.jk_pasien
            },
        "dokter": {
            "nama_dokter": rm.invoice.dokter.nama_dokter,
            "spesialis": {
                "nama_spesialis": rm.invoice.dokter.spesialis.nama_spesialis
            }
        }
    }

    return response