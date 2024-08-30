# KServe Serving Runtimes

This directory contains the list of KServe serving runtimes that can be deployed via [KServe InferenceServices](./inferenceservice).

The examples available here will contain the default KServe Serving Runtimes, as follows:

- **[huggingfaceserver](huggingfaceserver-serving-runtime.yaml)**: A serving runtime for Hugging Face models, supporting 
transformer-based models for tasks like text classification, translation, and more, few examples of supported models:
  - BERT: text classification
  - GPT-2: text generation
  - T5: translation tasks
- **[lgbserver](lgbserver-serving-runtime.yaml)**: A serving runtime for LightGBM models, optimized for high-performance 
gradient boosting. Used in tasks like:
  - regression
  - classification
  - ranking
- **[mlserver](mlserver-serving-runtime.yaml)**: A versatile serving runtime that supports multiple machine learning 
frameworks and custom runtimes. Can
be used to serve a few frameworks like:
  - ONNX
  - scikit-learn
  - custom Python based models
- **[paddleserver](paddleserver-serving-runtime.yaml)**: A serving runtime for PaddlePaddle models, designed for deep 
learning tasks.
    - Supports PaddlePaddle Models for image classification, object detection and NLP.
- **[pmmlserver](pmmlserver-serving-runtime.yaml)**: A serving runtime for PMML (Predictive Model Markup Language) models, 
used for sharing predictive models between applications.
    - Serves PMML models for predictive analytics like decision trees, logistic regression and neural networks.
- **[sklearnserver](sklearnserver-serving-runtime.yaml)**: A serving runtime for scikit-learn models, supporting a wide 
range of machine learning algorithms like:
  - clustering
  - regression
  - classification
- **[tensorflow-serving](tensorflow-serving-serving-runtime.yaml)**: A serving runtime for TensorFlow models, optimized 
for production environments to serve tasks like:
  - Image recognition
  - NLP
  - Time series forecasting
- **[torchserve](torchserve-serving-runtime.yaml)**: A serving runtime for PyTorch models, designed for scalable and 
efficient model serving, the supported models includes
  - Image recognition
  - NLP
  - Recommendation systems
- **[tritonserver](tritonserver-serving-runtime.yaml)**: A serving runtime for NVIDIA Triton Inference Server, supporting 
multiple frameworks and high-performance inference. A few supported frameworks:
  - TensorFlow
  - PyTorch
  - ONNX
  - And custom model for high-performance inference
- **[xgbserver](xgbserver-serving-runtime.yaml)**: A serving runtime for XGBoost models, optimized for gradient boosting 
and decision tree algorithms. Supports tasks like:
  - Classification
  - Regression
  - Ranking