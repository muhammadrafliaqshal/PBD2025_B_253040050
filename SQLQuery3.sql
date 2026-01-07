SELECT b.id_buku, b.judul, b.penulis, b.harga, k.nama_kategori
FROM buku b
JOIN kategori k ON b.id_kategori = k.id_kategori;


SELECT * FROM pelanggan
WHERE email IS NOT NULL
ORDER BY nama_pelanggan ASC;


SELECT * FROM buku
WHERE harga > 50000
ORDER BY harga DESC;


SELECT k.nama_kategori, COUNT(b.id_buku) AS jumlah_buku
FROM kategori k
LEFT JOIN buku b ON k.id_kategori = b.id_kategori
GROUP BY k.nama_kategori;


SELECT p.id_penjualan, pl.nama_pelanggan, p.tanggal
FROM penjualan p
JOIN pelanggan pl ON p.id_pelanggan = pl.id_pelanggan
WHERE p.tanggal = '2025-12-01';


SELECT b.judul, SUM(dp.jumlah) AS total_terjual
FROM buku b
LEFT JOIN detail_penjualan dp ON b.id_buku = dp.id_buku
GROUP BY b.judul;


CREATE TABLE supplier (
    id_supplier INT PRIMARY KEY IDENTITY(1,1),
    nama_supplier VARCHAR(50) NOT NULL,
    telepon VARCHAR(20)
);
SELECT * FROM supplier;


INSERT INTO supplier (nama_supplier, telepon) VALUES
('Penerbit Gramedia', '021-123456'),
('Erlangga', '021-654321'),
('Mizan', '021-987654');
SELECT * FROM supplier;


UPDATE buku 
SET harga = 45000 
WHERE judul = 'Naruto Vol. 1';
SELECT * FROM buku WHERE judul = 'Naruto Vol. 1';


DELETE FROM detail_penjualan 
WHERE id_penjualan IN (SELECT id_penjualan FROM penjualan WHERE id_pelanggan = (SELECT id_pelanggan FROM pelanggan WHERE nama_pelanggan = 'Budi'));
DELETE FROM penjualan WHERE id_pelanggan = (SELECT id_pelanggan FROM pelanggan WHERE nama_pelanggan = 'Budi');
DELETE FROM pelanggan WHERE nama_pelanggan = 'Budi';
SELECT * FROM pelanggan;

