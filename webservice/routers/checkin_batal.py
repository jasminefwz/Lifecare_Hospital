from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from . import schemas, models
from database import SessionLocal, engine

models.Base.metadata.create_all(bind=engine)

router = APIRouter()

# Function to get the database session
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# Endpoint to delete a checkin by id
@router.delete("/checkin_batal/{checkin_id}", response_model=schemas.Checkin)
def delete_checkin(checkin_id: int, db: Session = Depends(get_db)):
    checkin = db.query(models.Checkin).filter(models.Checkin.id_checkin == checkin_id).first()
    if checkin is None:
        raise HTTPException(status_code=404, detail="Checkin not found")
    db.delete(checkin)
    db.commit()
    return checkin


# # routers/checkin_batal.py

# from fastapi import APIRouter, Depends, HTTPException
# from sqlalchemy.orm import Session
# from typing import List
# import models, schemas
# from database import get_db

# checkin_batal_router = APIRouter(
#     prefix="/checkin_batal",
#     tags=["checkin_batal"],
# )

# @checkin_batal_router.delete("/{checkin_id}", response_model=schemas.Message)
# def delete_checkin(checkin_id: int, db: Session = Depends(get_db)):
#     checkin = db.query(models.Checkin).filter(models.Checkin.id_checkin == checkin_id).first()
#     if checkin:
#         db.delete(checkin)
#         db.commit()
#         return {"message": "Checkin berhasil dibatalkan"}
#     else:
#         raise HTTPException(status_code=404, detail="Checkin tidak ditemukan")

# # Pastikan router diekspor dengan nama yang benar
# # checkin_batal_router = router
