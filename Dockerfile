# 1、從官方 Python 基礎映象開始
FROM python:3.9

# 2、將當前工作目錄設定為 /code
# 這是放置 requirements.txt 檔案和應用程式目錄的地方
WORKDIR /code

# 3、先複製 requirements.txt 檔案
# 由於這個檔案不經常更改，Docker 會檢測它並在這一步使用快取，也為下一步啟用快取
COPY ./requirements.txt /code/requirements.txt

# 4、執行 pip 命令安裝依賴項
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# 5、複製 FastAPI 專案程式碼
COPY ./app /code/app

# 6、執行服務
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "5000"]

# 7. 開放port
EXPOSE 5000
