import streamlit as st 
from googletrans import Translator


languages=['Tamil','Hindi','Kannada',"Filipino","Finnish","French", "Georgian","Hebrew", "Malayalam", "Nepali","Telugu"]
st.title("Language Translation App")
source_text = st.text_area("Enter text to translate:")
target_language = st.selectbox("Select target language:", languages)
translate = st.button('Translate')
if translate:
    translator = Translator()
    out = translator.translate(source_text,dest=target_language)
    st.write(out.text)
    