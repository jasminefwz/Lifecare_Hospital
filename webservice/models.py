from sqlalchemy import Column, Integer, String, Text, DECIMAL, DateTime, ForeignKey, Boolean, Date, Time
from sqlalchemy.orm import relationship
from database import BaseDB
from datetime import datetime

class User(BaseDB):
    __tablename__ = "user"

    id_user = Column(Integer, primary_key=True, index=True)
    nama_user = Column(String(255))
    nik_user = Column(String(255), unique=True, index=True)
    tmpt_lahir_user = Column(String(255))
    tl_user = Column(DateTime)
    jk_user = Column(String(255))
    alamat_user = Column(String(255))
    telp_user = Column(String(255))
    email_user = Column(String(255))
    pass_user = Column(String(255))
    username = Column(String(255))

    # Relationship
    tokens = relationship("Token", back_populates="user")

class Token(BaseDB):
    __tablename__ = "token"
    user_id = Column(Integer, ForeignKey("user.id_user"), nullable=False)
    access_token = Column(String(450), primary_key=True, index=True)
    refresh_token = Column(String(450), index=True)
    status = Column(Boolean)
    created_date = Column(DateTime, default=datetime.now)

    # Relationship
    user = relationship("User", back_populates="tokens")

class Pasien(BaseDB):
    __tablename__ = "pasien"
    id_pasien = Column(Integer, primary_key=True, index=True)
    nama_pasien = Column(String, nullable=False)
    nik_pasien = Column(String, nullable=False)
    tmpt_lahir_pasien = Column(String, nullable=False)
    tl_pasien = Column(Date, nullable=False)
    jk_pasien = Column(String, nullable=False)
    alamat_pasien = Column(String, nullable=False)
    telp_pasien = Column(String, nullable=False)
    nama_pemesan = Column(String, nullable=False)
    telp_pemesan = Column(String, nullable=False)
    
class Artikel(BaseDB):
    __tablename__ = 'artikel'

    id_artikel = Column(Integer, primary_key=True)
    judul_artikel = Column(String(255))
    isi_artikel = Column(String(5000))
    foto_artikel = Column(String(255))
    
class Hari(BaseDB):
    __tablename__ = "hari"
    id_hari = Column(Integer, primary_key=True, index=True)
    nama_hari = Column(String, nullable=False)

class Spesialis(BaseDB):
    __tablename__ = "spesialis"
    id_spesialis = Column(Integer, primary_key=True, index=True)
    nama_spesialis = Column(String, nullable=False)

class Waktu(BaseDB):
    __tablename__ = "waktu"
    id_waktu = Column(Integer, primary_key=True, index=True)
    nama_waktu = Column(String, nullable=False)

class Dokter(BaseDB):
    __tablename__ = "dokter"
    id_dokter = Column(Integer, primary_key=True, index=True)
    nama_dokter = Column(String, nullable=False)
    id_spesialis_d = Column(Integer, ForeignKey('spesialis.id_spesialis'), nullable=False)
    deskripsi_dokter = Column(String, nullable=False)
    foto_dokter = Column(String(255))

    spesialis = relationship("Spesialis")

class DokterHariWaktu(BaseDB):
    __tablename__ = "dokter_hari_waktu"
    id_dokter_hari_waktu = Column(Integer, primary_key=True, index=True)
    id_dokter = Column(Integer, ForeignKey('dokter.id_dokter'), nullable=False)
    id_hari_d = Column(Integer, ForeignKey('hari.id_hari'), nullable=False)
    id_waktu_d = Column(Integer, ForeignKey('waktu.id_waktu'), nullable=False)
    dokter = relationship("Dokter")
    hari = relationship("Hari")
    waktu = relationship("Waktu")
    
class PembayaranAkhir(BaseDB):
    __tablename__ = 'pembayaran_akhir'

    id_pembayaran = Column(Integer, primary_key=True, index=True, autoincrement=True)
    id_rekmedis = Column(Integer, ForeignKey('rekam_medis.id_rekammedis'), nullable=False)
    id_metode_pembayaran = Column(Integer, ForeignKey('metode_pembayaran.id_metode_pembayaran'), nullable=False)
    total_harga = Column(String, nullable=False)
    id_status_pa = Column(Integer, ForeignKey('status_bayar_akhir.id_bayar'), nullable=False)

    metode_pembayaran = relationship("MetodePembayaran", back_populates="pembayaran")
    status_pembayaran = relationship("StatusBayarAkhir", back_populates="pembayaran")

class MetodePembayaran(BaseDB):
    __tablename__ = 'metode_pembayaran'

    id_metode_pembayaran = Column(Integer, primary_key=True, index=True)
    metode_pembayaran = Column(String)
    kode_metode = Column(String)

    pembayaran = relationship("PembayaranAkhir", back_populates="metode_pembayaran")

class StatusBayarAkhir(BaseDB):
    __tablename__ = 'status_bayar_akhir'

    id_bayar = Column(Integer, primary_key=True, index=True)
    status_bayar = Column(String)

    pembayaran = relationship("PembayaranAkhir", back_populates="status_pembayaran")
        
# class MetodePembayaran(BaseDB):
#     __tablename__ = 'metode_pembayaran'

#     id_metode_pembayaran = Column(Integer, primary_key=True, index=True)
#     metode_pembayaran = Column(String)
#     kode_metode = Column(String)

#     pembayaran = relationship("PembayaranAkhir", back_populates="metode_pembayaran")

# class PembayaranAkhir(BaseDB):
#     __tablename__ = 'pembayaran_akhir'

#     id_pembayaran = Column(Integer, primary_key=True, index=True)
#     id_rekmedis = Column(Integer)
#     id_metode_pembayaran = Column(Integer, ForeignKey('metode_pembayaran.id_metode_pembayaran'))
#     total_harga = Column(String)
#     status_pembayaran = Column(String, default="pending")
    
#     metode_pembayaran = relationship("MetodePembayaran", back_populates="pembayaran")

class MedCekk(BaseDB):
    __tablename__ = "medcek"

    id_medcek = Column(Integer, primary_key=True, index=True)
    paket_medcek = Column(String, nullable=False)
    nama_medcek = Column(String, nullable=False)
    harga_medcek = Column(String, nullable=False)
    detail_medcek = Column(String, nullable=False)
    prosedur_medcek = Column(String, nullable=False)

class StatusCheckin(BaseDB):
    __tablename__ = "status_checkin"
    
    id_checkin = Column(Integer, primary_key=True, index=True)
    status_checkin = Column(String, index=True)

class Invoice(BaseDB):
    __tablename__ = "invoice"
    
    id_invoice = Column(Integer, primary_key=True, index=True)
    no_invoice = Column(String, index=True)
    no_antrian = Column(Integer)
    tgl_invoice = Column(Date)
    waktu_invoice = Column(Time)
    id_dokter_i = Column(Integer, ForeignKey('dokter.id_dokter'))
    id_pasien_i = Column(Integer, ForeignKey('pasien.id_pasien'))
    id_status_checkin = Column(Integer, ForeignKey('status_checkin.id_checkin'))
    
    dokter = relationship("Dokter")
    pasien = relationship("Pasien")
    status_checkin = relationship("StatusCheckin")


class RekamMedis(BaseDB):
    __tablename__ = "rekam_medis"

    id_rekammedis = Column(Integer, primary_key=True, index=True)
    id_invoice = Column(Integer, ForeignKey("invoice.id_invoice"), nullable=False)
    bb_pasien = Column(Integer, nullable=False)
    tekanan_darah = Column(String(255), nullable=False)
    hasil_diagnosa = Column(String(255), nullable=False)
    resep_obat = Column(String(255), nullable=False)
    id_status_bayar_akhir = Column(Integer, ForeignKey("status_bayar_akhir.id_bayar"), nullable=False)

    invoice = relationship("Invoice")

# class Checkin(BaseDB):
#     __tablename__ = "status_checkin"

#     id_checkin = Column(Integer, primary_key=True, index=True)
#     status_checkin = Column(String, index=True)

# class PembayaranAkhir(BaseDB):
#     __tablename__ = "pembayaran_akhir"
#     _table_args_ = {'extend_existing': True}
    
#     id_pembayaran = Column(Integer, primary_key=True, index=True)
#     id_metode_pembayaran = Column(Integer, ForeignKey("metode_pembayaran.id_metode_pembayaran"))
#     total_harga = Column(String(255), nullable=False)
#     id_bayar = Column(Integer, ForeignKey("status_bayar_akhir.id_bayar"))

#     metode_pembayaran = relationship("MetodePembayaran", back_populates="pembayaran")
#     status_bayar = relationship("StatusBayarAkhir", back_populates="pembayaran")

# class MetodePembayaran(BaseDB):
#     __tablename__ = "metode_pembayaran"
#     _table_args_ = {'extend_existing': True}
    
#     id_metode_pembayaran = Column(Integer, primary_key=True, index=True)
#     nama_metode = Column(String(255), nullable=False)
#     pembayaran = relationship("PembayaranAkhir", back_populates="metode_pembayaran")

# class StatusBayarAkhir(BaseDB):
#     __tablename__ = "status_bayar_akhir"
#     _table_args_ = {'extend_existing': True}
    
#     id_bayar = Column(Integer, primary_key=True, index=True)
#     status = Column(String(255), nullable=False)
#     pembayaran = relationship("PembayaranAkhir", back_populates="status_bayar")
