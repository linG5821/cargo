FROM registry.baidubce.com/paddlepaddle/serving:0.9.0-cuda11.2-cudnn8-runtime

COPY PaddleOCR/deploy/pdserving/ /deploy
COPY PaddleOCR/requirements.txt /deploy
WORKDIR /deploy

RUN pip config set global.index-url https://mirror.baidu.com/pypi/simple \
  && python3.6 -m pip install --upgrade setuptools \
  && python3.6 -m pip install --upgrade pip \
  && pip install -r requirements.txt

RUN wget https://paddleocr.bj.bcebos.com/PP-OCRv3/chinese/ch_PP-OCRv3_det_infer.tar -O ch_PP-OCRv3_det_infer.tar && tar -xf ch_PP-OCRv3_det_infer.tar \
  && wget https://paddleocr.bj.bcebos.com/PP-OCRv3/chinese/ch_PP-OCRv3_rec_infer.tar -O ch_PP-OCRv3_rec_infer.tar &&  tar -xf ch_PP-OCRv3_rec_infer.tar

RUN python3.6 -m paddle_serving_client.convert --dirname ./ch_PP-OCRv3_det_infer/ \
  --model_filename inference.pdmodel          \
  --params_filename inference.pdiparams       \
  --serving_server ./ppocr_det_v3_serving/ \
  --serving_client ./ppocr_det_v3_client/ \
  && python3.6 -m paddle_serving_client.convert --dirname ./ch_PP-OCRv3_rec_infer/ \
  --model_filename inference.pdmodel          \
  --params_filename inference.pdiparams       \
  --serving_server ./ppocr_rec_v3_serving/  \
  --serving_client ./ppocr_rec_v3_client/

# ENTRYPOINT ["python3.6", "web_service.py", "--config=config.yml"]
ENTRYPOINT ["bash"]
