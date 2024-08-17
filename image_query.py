#from langchain.output_parsers import StrOutputParser
import streamlit as st
import os
import google.generativeai as genai
from PIL import Image

# Configure the Gemini API
GOOGLE_API_KEY = "AIzaSyAMaomWdpLnofD7XJ5gZeMIwKqYqwYSa6M"
genai.configure(api_key=GOOGLE_API_KEY)
model = genai.GenerativeModel("gemini-1.5-pro")
chat = model.start_chat(history=[])

# Function to get the response from Gemini model
def get_gemini_response(question, image=None):
    if image:
        response = model.generate_content([image, question])
    else:
        response = chat.send_message(question, stream=True)
    return response

# Streamlit UI configuration
st.set_page_config(page_title="Image Q&A")
st.header("Gemini Pro LLM Mini Project")

# Initialize chat history in session state
if 'chat_history' not in st.session_state:
    st.session_state['chat_history'] = []

# User input and image upload
input = st.text_input("Input: ", key='input')
uploaded_image = st.file_uploader("Upload an Image", type=["png", "jpg", "jpeg"], key='image')
submit = st.button('Ask Chat')

# Process the input and generate a response
if submit and input:
    image = None
    if uploaded_image:
        image = Image.open(uploaded_image)
    
    response = get_gemini_response(input, image=image)
    
    # Update the chat history with the user's question
    st.session_state['chat_history'].append(('You', input))
    
    # Display the response
    st.subheader("The response is:")
    if isinstance(response, list):  # For image Q&A
        for chunk in response:
            st.write(chunk.text)
            st.session_state['chat_history'].append(('Bot', chunk.text))
    else:  # For text Q&A
        for chunk in response:
            st.write(chunk.text)
            st.session_state['chat_history'].append(('Bot', chunk.text))

    # Display the chat history
    st.subheader("The chat history is:")
    for role, text in st.session_state['chat_history']:
        st.write(f"{role}: {text}")

