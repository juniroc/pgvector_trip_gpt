import os
import pandas as pd
from embedding import Embedding

print("start")

directory_path = "datas"
file_name = "question_answer_pairs.txt"

file_path = os.path.join(directory_path, file_name)

df = pd.read_csv(file_path, sep="\t")

print(df.head())

embedding = Embedding()

result_dataframe = embedding.get_sentence_transformer_ef(df, "Question")

print(result_dataframe.head())

result_dataframe.to_csv("./sample.csv")
