import pandas as pd
import numpy as np
from sentence_transformers import SentenceTransformer


class Embedding:
    def __init__(self):

        # Load https://huggingface.co/sentence-transformers/all-mpnet-base-v2
        self.model = SentenceTransformer("all-mpnet-base-v2")

    def get_sentence_transformer_ef(
        self, source_dataframe: pd.DataFrame, column_name: str
    ):

        cleaned_dataframe = source_dataframe.dropna(subset=[column_name])
        embedded_list = self.model.encode(cleaned_dataframe[column_name])
        embedded_list = [np.array(embedding) for embedding in embedded_list]
        cleaned_dataframe["embedding"] = embedded_list
        return cleaned_dataframe
