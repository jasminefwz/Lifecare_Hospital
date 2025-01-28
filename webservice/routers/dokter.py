from fastapi import APIRouter, Depends, HTTPException, File, UploadFile, Form
from sqlalchemy.orm import Session
import os
from sqlalchemy.sql import func
from fastapi.responses import FileResponse
from typing import List
from models import *
from database import get_db
from schemas import *
from dependencies import *

dokter_router = APIRouter(prefix='/dokters', tags=['dokters'])

# @dokter_router.get("/alldokter", response_model=ResponseBase)
# def get_all_dokter(db: Session = Depends(get_db)):
#     results = db.query(Dokter).all()
#     dokter_dict = {}
#     for dokter in results:
#         dokter_hari_waktu_list = db.query(DokterHariWaktu).filter(DokterHariWaktu.id_dokter == dokter.id_dokter).all()
#         hari_list = [hw.hari.nama_hari for hw in dokter_hari_waktu_list]
#         if dokter.id_dokter not in dokter_dict:
#             dokter_dict[dokter.id_dokter] = {
#                 "nama_dokter": dokter.nama_dokter,
#                 "spesialis": dokter.spesialis.nama_spesialis,
#                 "hari": hari_list
#             }
#     response_data = [DokterListResponseData(**data) for data in dokter_dict.values()]
#     return ResponseBase(message="Dokters retrieved successfully", data=response_data, error=False)
@dokter_router.get("/alldokter", response_model=ResponseBase)
def get_all_dokter(db: Session = Depends(get_db)):
    results = db.query(Dokter).all()
    dokter_dict = {}
    for dokter in results:
        dokter_hari_waktu_list = db.query(DokterHariWaktu).filter(DokterHariWaktu.id_dokter == dokter.id_dokter).all()
        hari_list = [hw.hari.nama_hari for hw in dokter_hari_waktu_list]
        if dokter.id_dokter not in dokter_dict:
            dokter_dict[dokter.id_dokter] = {
                "id_dokter": dokter.id_dokter,
                "nama_dokter": dokter.nama_dokter,
                "spesialis": dokter.spesialis.nama_spesialis,
                "hari": hari_list,
                "foto_dokter": dokter.foto_dokter  # Add this line
            }
    response_data = [DokterListResponseData(**data) for data in dokter_dict.values()]
    return ResponseBase(message="Dokters retrieved successfully", data=response_data, error=False)


@dokter_router.get("/searchdokter", response_model=list[DokterSearchResponse])
def search_dokter(nama: str, db: Session = Depends(get_db)):
    results = db.query(Dokter).filter(func.lower(Dokter.nama_dokter).contains(func.lower(nama))).all()
    return results

@dokter_router.get('/filterhari', response_model=dict)
async def read_all_hari_endpoint(db: Session = Depends(get_db)):
    hari_list = db.query(Hari).all()
    if not hari_list:
        raise HTTPException(status_code=404, detail="Hari tidak ditemukan")

    response = [{"id_hari": hari.id_hari, "nama_hari": hari.nama_hari} for hari in hari_list]

    return {
        "message": "Hari berhasil diambil",
        "hari": response
    }

@dokter_router.get('/filterwaktu', response_model=dict)
async def read_all_waktu_endpoint(db: Session = Depends(get_db)):
    waktu_list = db.query(Waktu).all()
    if not waktu_list:
        raise HTTPException(status_code=404, detail="Waktu tidak ditemukan")

    response = [{"id_waktu": waktu.id_waktu, "nama_waktu": waktu.nama_waktu} for waktu in waktu_list]

    return {
        "message": "Waktu berhasil diambil",
        "waktu": response
    }

@dokter_router.get('/filterspesialis', response_model=dict)
async def read_all_spesialis_endpoint(db: Session = Depends(get_db)):
    spesialis_list = db.query(Spesialis).all()
    if not spesialis_list:
        raise HTTPException(status_code=404, detail="Spesialis tidak ditemukan")

    response = [{"id_spesialis": spesialis.id_spesialis, "nama_spesialis": spesialis.nama_spesialis} for spesialis in spesialis_list]

    return {
        "message": "Spesialis berhasil diambil",
        "spesialis": response
    }
    
@dokter_router.post("/pilihfilterspesialisasi", response_model=list[DokterBase])
def pilih_filter_spesialisasi(filter: FilterSpesialisasi, db: Session = Depends(get_db)):
    dokters = db.query(Dokter).filter(Dokter.id_spesialis_d == filter.id_spesialis).all()
    return dokters

@dokter_router.post("/pilihfilterhari", response_model=list[DokterHariWaktuBase])
def pilih_filter_hari(filter: FilterHari, db: Session = Depends(get_db)):
    dokter_hari_waktus = db.query(DokterHariWaktu).filter(DokterHariWaktu.id_hari_d == filter.id_hari).all()
    return dokter_hari_waktus

@dokter_router.post("/pilihfilterwaktu", response_model=list[DokterHariWaktuBase])
def pilih_filter_waktu(filter: FilterWaktu, db: Session = Depends(get_db)):
    dokter_hari_waktus = db.query(DokterHariWaktu).filter(DokterHariWaktu.id_waktu_d == filter.id_waktu).all()
    return dokter_hari_waktus

@dokter_router.get("/fotodetaildokter/{id_dokter}")
def foto_detail_dokter(id_dokter: int, db: Session = Depends(get_db)):
    dokter = db.query(Dokter).filter(Dokter.id_dokter == id_dokter).first()
    if not dokter:
        raise HTTPException(status_code=404, detail="Dokter not found")
    # Assuming you have a photo URL or path stored in the dokter table
    return {"photo_url": f"/images/{dokter.id_dokter}"}

@dokter_router.get("/detaildokter/{id_dokter}", response_model=DokterDetail)
def detail_dokter(id_dokter: int, db: Session = Depends(get_db)):
    dokter = db.query(Dokter).filter(Dokter.id_dokter == id_dokter).first()
    if not dokter:
        raise HTTPException(status_code=404, detail="Dokter not found")
    
    dokter_hari_waktu_list = db.query(DokterHariWaktu).filter(DokterHariWaktu.id_dokter == id_dokter).all()
    if not dokter_hari_waktu_list:
        raise HTTPException(status_code=404, detail="Dokter schedule not found")

    jadwal = [{"hari": d.hari, "waktu": d.waktu} for d in dokter_hari_waktu_list]

    return {
        "id_dokter": dokter.id_dokter,
        "nama_dokter": dokter.nama_dokter,
        "spesialis": dokter.spesialis,
        "jadwal": jadwal,
        "deskripsi_dokter": dokter.deskripsi_dokter,
        "foto_dokter": dokter.foto_dokter
    }

# @dokter_router.get("/jadwaldokter/{id_dokter}", response_model=list[HariWaktu])
# def jadwal_dokter(id_dokter: int, db: Session = Depends(get_db)):
#     jadwal = db.query(DokterHariWaktu).filter(DokterHariWaktu.id_dokter == id_dokter).all()
#     if not jadwal:
#         raise HTTPException(status_code=404, detail="Jadwal dokter tidak ditemukan")
#     return [{"hari": j.hari, "waktu": j.waktu} for j in jadwal]

# from sqlalchemy import not_

@dokter_router.get("/jadwaldokter/{id_dokter}", response_model=list[HariWaktu])
def jadwal_dokter(id_dokter: int, db: Session = Depends(get_db)):
    jadwal = db.query(DokterHariWaktu).filter(
        DokterHariWaktu.id_dokter == id_dokter,
        DokterHariWaktu.id_dokter.isnot(None),  # Memastikan id_dokter tidak null
        DokterHariWaktu.id_hari_d.isnot(None),  # Memastikan id_hari_d tidak null
        DokterHariWaktu.id_waktu_d.isnot(None),  # Memastikan id_waktu_d tidak null
    ).all()
    
    if not jadwal:
        raise HTTPException(status_code=404, detail="Jadwal dokter tidak ditemukan")
    
    return [{"hari": j.hari, "waktu": j.waktu} for j in jadwal]


