import re
import os
import sys
import nltk
import gensim
import itertools
import numpy as np
import pandas as pd
#import seaborn as sns
import tensorflow as tf
#from wordcloud import WordCloud
#import matplotlib.pyplot as plt
from tensorflow import keras
from nltk.corpus import stopwords
from tensorflow.keras.layers import LSTM
from tensorflow.keras.layers import Dense
from keras.layers import SpatialDropout1D
from nltk.stem.porter import PorterStemmer
from tensorflow.keras.layers import Dropout
from tensorflow.keras.layers import Embedding
from keras.preprocessing.text import Tokenizer
from tensorflow.keras.models import Sequential
from sklearn.metrics import classification_report
from sklearn.model_selection import train_test_split
from tensorflow.keras.preprocessing.text import one_hot
from tensorflow.keras.preprocessing.sequence import pad_sequences


def text_predict(text): 
    model = tf.keras.models.load_model('C:/Users/arsla/source/repos/FakeNewsDetector_ASP/FakeNewsDetector_ASP/Python/FakeNewsLSTM.h5')
    
    #trainDataset = pd.read_csv("Datasets/preprocessed_trainingData.csv",encoding='latin-1')
    #trainDataset = trainDataset.dropna(subset=['text'])
    
    inputValue_test = []

    ps = PorterStemmer()
    review = re.sub('[^a-zA-Z]', ' ',text)
    review = review.lower()
    review = review.split()
    review = [ps.stem(word) for word in review if not word in stopwords.words('english')]
    review = ' '.join(review)

    stop_words = set(nltk.corpus.stopwords.words("english"))
    tokenizer = nltk.tokenize.RegexpTokenizer(r'\w+')
    sentences = nltk.sent_tokenize(review)
    for sent in sentences:
        sent = sent.lower()
        tokens = tokenizer.tokenize(sent)
        filtered_words = [w.strip() for w in tokens if w not in stop_words and len(w) > 1]
        filtered_words = ' '.join(filtered_words)
        inputValue_test.append(filtered_words)

    voc_len=len(inputValue_test)
    
    
    #tokenizer = Tokenizer()
    #tokenizer.fit_on_texts(trainDataset['text'].values)
    #joblib.dump(tokenizer, 'Model/LSTM_Tokenizer.pkl')
    
    tokenizer = joblib.load('C:/Users/arsla/source/repos/FakeNewsDetector_ASP/FakeNewsDetector_ASP/Python/LSTM_Tokenizer.pkl')
    X_test = tokenizer.texts_to_sequences(inputValue_test)
    padded = pad_sequences(X_test, maxlen=1000)
    y_pred=(model.predict(padded) > 0.5).astype("int32")
    pprint(y_pred[0][0])
    
    #onehot_repr_test = [one_hot(word, voc_len) for word in inputValue_test]
    #embedded_docs_test=pad_sequences(onehot_repr_test,maxlen=1000)
    #X_test=np.array(embedded_docs_test)
    #y_pred=(model.predict(X_test) > 0.5).astype("int32")
    #print(y_pred[0][0])


if __name__ == "__main__":
    text_predict(sys.argv[1])








