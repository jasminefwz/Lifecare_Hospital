from pydantic import BaseModel
from datetime import datetime
from datetime import date, time
from typing import List
from typing import Optional, Any

class ResponseBase(BaseModel):
    message: str
    data: Optional[Any] = None
    error: bool

class UserResponseData(BaseModel):
    username: str
    id_user: Optional[int] = None
    nama: str
    nik: str
    tmpt: str
    tl: datetime
    jk: str
    telp: str
    email: str
    
class UserCreate(BaseModel):
    nama_user: str 
    nik_user: str
    tmpt_lahir_user: str
    tl_user: datetime
    jk_user: str
    alamat_user: str
    telp_user: str
    email_user: str
    pass_user: str
    username: str

class UserLogin(BaseModel):
    username: str
    password: str
    
class changepassword(BaseModel):
    username: str
    old_password: str
    new_password: str

class PasswordChangeResponseData(BaseModel):
    pass
    
class TokenResponseData(BaseModel):
    access_token: str
    refresh_token: str
    id_user: int
    
class TokenCreate(BaseModel):
    user_id: str
    access_token: str
    refresh_token: str
    status: bool
    created_date: datetime

class UserListResponseData(BaseModel):
    id: int
    username: str

class ArtikelCreate(BaseModel):
    id_artikel: int
    judul_artikel: str
    isi_artikel: str
    foto_artikel: str
    
class ArtikelAwal(BaseModel):
    id_artikel: int
    judul_artikel: str
    foto_artikel: str

class ArtikelResponseData(BaseModel):
    id_artikel: int
    judul_artikel: str
    isi_artikel: str
    foto_artikel: str
    
class SpesialisBase(BaseModel):
    id_spesialis: int
    nama_spesialis: str

    class Config:
        orm_mode = True
        
class HariBase(BaseModel):
    id_hari: int
    nama_hari: str

    class Config:
        orm_mode = True


class WaktuBase(BaseModel):
    id_waktu: int
    nama_waktu: str

    class Config:
        orm_mode = True

class HariWaktu(BaseModel):
    hari: HariBase
    waktu: WaktuBase

    class Config:
        orm_mode = True
        
class DokterBase(BaseModel):
    id_dokter: int
    nama_dokter: str
    id_spesialis_d: int
    deskripsi_dokter: str
    spesialis: SpesialisBase
    foto_dokter: str
    
    class Config:
        orm_mode = True

        
class DokterHariWaktuBase(BaseModel):
    id_dokter_hari_waktu: int
    id_dokter: int
    id_hari_d: int
    id_waktu_d: int
    dokter: DokterBase
    hari: HariBase
    waktu: WaktuBase

    class Config:
        orm_mode = True

class DokterSearchResponse(BaseModel):
    id_dokter: int
    nama_dokter: str

    class Config:
        orm_mode = True
        
class DokterListResponseData(BaseModel):
    id_dokter: int
    nama_dokter: str
    spesialis: str
    hari: list[str]
    foto_dokter: str  # Add this line

    class Config:
        orm_mode = True

    
class FilterSpesialisasi(BaseModel):
    id_spesialis: int

class FilterHari(BaseModel):
    id_hari: int

class FilterWaktu(BaseModel):
    id_waktu: int

        
class DokterDetail(BaseModel):
    id_dokter: int
    nama_dokter: str
    spesialis: SpesialisBase
    jadwal: list[HariWaktu]
    deskripsi_dokter: str
    foto_dokter: str
    
    
class UserBase(BaseModel):
    nama_user: str
    nik_user: str
    tmpt_lahir_user: str
    tl_user: date
    jk_user: str
    alamat_user: str
    telp_user: str
    email_user: str
    username: str

    class Config:
        orm_mode = True

class PasienBase(BaseModel):
    nama_pasien: str
    nik_pasien: str
    tmpt_lahir_pasien: str
    tl_pasien: datetime
    jk_pasien: str
    alamat_pasien: str
    telp_pasien: str
    nama_pemesan: str
    telp_pemesan: str

    class Config:
        orm_mode = True

class UserResponse(UserBase):
    id_user: int

class UserUpdateRequest(BaseModel):
    nama_user: Optional[str]
    nik_user: Optional[str]
    tmpt_lahir_user: Optional[str]
    tl_user: Optional[str]
    jk_user: Optional[str]
    alamat_user: Optional[str]
    telp_user: Optional[str]
    email_user: Optional[str]
    
class PasienResponse(PasienBase):
    id_pasien: int

class PasienCreate(PasienBase):
    pass

class Pasien(PasienBase):
    id_pasien: int

    class Config:
        orm_mode = True


class InvoiceBase(BaseModel):
    no_invoice: str
    no_antrian: int
    tgl_invoice: datetime
    waktu_invoice: datetime
    id_dokter_i: int
    id_pasien_i: int
    qrcode: str
    pdf_invoice: str

class InvoiceCreate(InvoiceBase):
    pass

class Invoice(InvoiceBase):
    id_invoice: int

    class Config:
        orm_mode = True

class KonfirmasiPembayaranCreate(BaseModel):
    id_pembayaran: int
    id_metode_pembayaran: int
    id_status_pa: int

class MetodePembayaranBase(BaseModel):
    metode_pembayaran: str
    kode_metode: str

class MetodePembayaranCreate(MetodePembayaranBase):
    pass

class MetodePembayaran(MetodePembayaranBase):
    id_metode_pembayaran: int

    class Config:
        orm_mode = True

class StatusBayarAkhirBase(BaseModel):
    status_bayar: str

class StatusBayarAkhirCreate(StatusBayarAkhirBase):
    pass

class StatusBayarAkhir(StatusBayarAkhirBase):
    id_bayar: int

    class Config:
        orm_mode = True

# class MetodePembayaranBase(BaseModel):
#     metode_pembayaran: str
#     kode_metode: str

# class MetodePembayaranCreate(MetodePembayaranBase):
#     pass

# class MetodePembayaran(MetodePembayaranBase):
#     id_metode_pembayaran: int

#     class Config:
#         orm_mode = True

# class KonfirmasiPembayaranCreate(BaseModel):
#     id_pembayaran: int
#     id_metode_pembayaran: int
#     status_pembayaran: str

#     class Config:
#         orm_mode = True

class MedCekBase(BaseModel):
    paket_medcek: str
    nama_medcek: str
    harga_medcek: str
    detail_medcek: str
    prosedur_medcek: str

class MedCek(MedCekBase):
    id_medcek: int

    class Config:
        orm_mode = True

class MedCekSimple(BaseModel):
    id_medcek: int
    paket_medcek: str
    nama_medcek: str
    harga_medcek: str

    class Config:
        orm_mode = True


class InvoiceBase(BaseModel):
    tgl_invoice: date
    waktu_invoice: time
    id_dokter_i: int
    id_pasien_i: int
    id_status_checkin: int

class InvoiceCreate(InvoiceBase):
    pass

class Invoice(InvoiceBase):
    id_invoice: int
    no_invoice: str
    no_antrian: int
    
    class Config:
        orm_mode = True

class PatientHistory(BaseModel):
    id_invoice: int
    no_invoice: str
    no_antrian: int
    tgl_invoice: date
    waktu_invoice: time
    id_dokter_i: int
    id_pasien_i: int
    id_status_checkin: int
    
    class Config:
        orm_mode = True

class DokterSpesialisSearch(BaseModel):
    id_dokter: int
    nama_dokter: str
    id_spesialis_d: int
    deskripsi_dokter: str

    class Config:
        orm_mode = True

# class RekamMedisBase(BaseModel):
#     id_invoice: int
#     bb_pasien: int
#     tekanan_darah: str
#     hasil_diagnosa: str
#     resep_obat: str
#     id_status_bayar_akhir: int

# class RekamMedisCreate(RekamMedisBase):
#     pass

# class RekamMedis(RekamMedisBase):
#     id_rekammedis: int

#     class Config:
#         orm_mode = True

class CheckinBase(BaseModel):
    status_checkin: str

class CheckinCreate(CheckinBase):
    pass

class Checkin(CheckinBase):
    id_checkin: int

    class Config:
        orm_mode = True

class PilihPasien(BaseModel):
    id_pasien: int
    nama_pasien: str
    tl_pasien: date
    jk_pasien: str

class PasienRM(BaseModel):
    nama_pasien: str
    tl_pasien: date
    jk_pasien: str

class SpesialisRM(BaseModel):
    nama_spesialis: str

class DokterRM(BaseModel):
    nama_dokter: str
    spesialis: SpesialisRM

class RekamMedisBase(BaseModel):
    id_invoice: int
    bb_pasien: int
    tekanan_darah: str
    hasil_diagnosa: str
    resep_obat: str
    id_status_bayar_akhir: int

class RekamMedisCreate(RekamMedisBase):
    pass

class RekamMedis(RekamMedisBase):
    id_rekammedis: int
    pasien: PasienRM
    dokter: DokterRM

    class Config:
        orm_mode = True
        
class InvoiceBase(BaseModel):
    tgl_invoice: date
    waktu_invoice: time
    id_dokter_i: int
    id_pasien_i: int
    id_status_checkin: int

class InvoiceCreate(InvoiceBase):
    pass

class Invoice(InvoiceBase):
    id_invoice: int
    no_invoice: str
    no_antrian: int
    
    class Config:
        orm_mode = True

class PatientHistory(BaseModel):
    id_invoice: int
    no_invoice: str
    no_antrian: int
    tgl_invoice: date
    waktu_invoice: time
    id_dokter_i: int
    id_pasien_i: int
    id_status_checkin: int
    
    class Config:
        orm_mode = True

class DokterSpesialisSearch(BaseModel):
    id_dokter: int
    nama_dokter: str
    id_spesialis_d: int
    deskripsi_dokter: str

    class Config:
        orm_mode = True