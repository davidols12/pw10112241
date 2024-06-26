import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'
import router from './router'

//Comienza firebase 
// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyAISnn5UMryvcLyE4P3UouShTKGnRXewUA",
  authDomain: "programacion-web-10588.firebaseapp.com",
  projectId: "programacion-web-10588",
  storageBucket: "programacion-web-10588.appspot.com",
  messagingSenderId: "395050712007",
  appId: "1:395050712007:web:462f56d69ede7abe8c37e2"
};

// Initialize Firebase
initializeApp(firebaseConfig);
//Termina firebase

const app = createApp(App)

app.use(router)

app.mount('#app')
