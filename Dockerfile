# 1. ใช้ Base Image เป็น Python เวอร์ชันเสถียร
FROM python:3.9-slim

# 2. ตั้งโฟลเดอร์ทำงานหลักใน Container
WORKDIR /app

# 3. ติดตั้ง Library ที่จำเป็น
RUN pip install streamlit

# 4. ก๊อปปี้โค้ดจาก Ubuntu เข้าไปใน Container
COPY app.py .

# 5. บอก Docker ว่าแอปนี้จะทำงานที่พอร์ต 8501 (พอร์ตหลักของ Streamlit)
EXPOSE 8501

# 6. คำสั่งที่จะให้รันตอน Container เปิดใช้งาน
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
