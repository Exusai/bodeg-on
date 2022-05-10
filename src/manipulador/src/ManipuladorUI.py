import time
import streamlit as st
import numpy as np
import matplotlib.pyplot as plt

st.set_page_config(layout="wide")

cajas_en_pallet = 0
cajas_recogidas = 0

# create a placeholder image using numpy array
img = np.zeros((256, 256, 3), dtype=np.uint8)
img[:, :, 0] = np.ones(img.shape[:2]) * 255
img[:, :, 1] = np.ones(img.shape[:2]) * 255
img[:, :, 2] = np.ones(img.shape[:2]) * 255

# placeholder for boxes visualization
arr = np.random.normal(1, 1, size=100)
fig, ax = plt.subplots()
ax.hist(arr, bins=20)

# Sidebar
with st.sidebar:
    st.header("Opciones para recoger cajas")

    add_radio = st.radio(
        "Estrategia para tomar cajas",
        ("Horizontal", "Vertical")
    )

    # Selecciona el tipo de caja 
    option = st.selectbox(
     'Tipo de cajas a tomar del pallet',
     ('Surido Ricolino', 'Botellas'))

    number = st.number_input('Número de Cajas a Recoger', min_value=1, step=1)

    st.write('Distribución de cajas de ', option, ' en el pallet:')

    # Muestra acomodo de las cajas
    st.pyplot(fig)

# Main content
st.title('Brazo manipulador')

col1, col2 = st.columns(2)
with col1:
    st.metric("Cajas a recoger de la tarima", str(int(number)) + " cajas")

with col2:
    st.metric("Cajas en la tarima del Order picker", str(int(cajas_en_pallet)) + " cajas")

cam, feedback = st.columns(2)

with col1:
    st.image(img, use_column_width=True)

with col2:
    if st.button('Start'):

        with st.spinner('Measuring...'):
            time.sleep(5)
            st.success('Inference complete!')
            st.info('Box position:')
        
        """ my_bar = st.progress(0)
        for percent_complete in range(100):
            time.sleep(0.1)
            cajas_recogidas += 1
            cajas_en_pallet += cajas_recogidas
            # update widgets with the new value
            #st.experimental_rerun()
            my_bar.progress(percent_complete + 1) """

        st.warning('Kinematic error')
        st.success('Cajas recogidas')
        st.error('This is an error')


txt = st.text_area('Comandos manuales',)
st.write('Comando enviado:', (txt))
