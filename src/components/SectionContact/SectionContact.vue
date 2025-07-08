<script setup lang="ts">
import {ref} from "vue";
import {useScrollAnimation} from "../../composables/useScroll";
import styles from "./SectionContact.module.scss";
import emailjs from "emailjs-com";

useScrollAnimation();

const formState = ref({
  subject: "",
  message: "",
});

const isSending = ref(false);
const isSent = ref(false);
const errorMessage = ref("");

const sendEmail = async () => {
  errorMessage.value = "";

  if (!formState.value.subject.trim()) {
    errorMessage.value = "Пожалуйста, введите заголовок сообщения";
    return;
  }

  if (!formState.value.message.trim() || formState.value.message.length < 10) {
    errorMessage.value = "Сообщение должно содержать не менее 10 символов";
    return;
  }

  isSending.value = true;

  try {
    await emailjs.send(
      import.meta.env.VITE_EMAILJS_SERVICE_ID,
      import.meta.env.VITE_EMAILJS_TEMPLATE_ID,
      {
        subject: formState.value.subject,
        message: formState.value.message,
        to_email: "gaigerov@gmail.com",
      },
      import.meta.env.VITE_EMAILJS_USER_ID
    );

    isSent.value = true;
    formState.value = { subject: "", message: "" };
  } catch (error) {
    console.error("Ошибка отправки:", error);
    errorMessage.value =
      "Произошла ошибка при отправке. Пожалуйста, попробуйте позже.";
  } finally {
    isSending.value = false;
  }
};
</script>

<template>
  <section id="contact" :class="['section', styles.contact]">
    <div class="fade-in" :class="styles.wrapper">
      <h2 :class="styles.title">Обратная связь</h2>

      <form v-if="!isSent" :class="styles.form" @submit.prevent="sendEmail">
        <div :class="styles.formGroup">
          <input
            v-model="formState.subject"
            type="text"
            :class="styles.input"
            placeholder=" "
            required
          />
          <label :class="styles.label">Заголовок сообщения</label>
          <div :class="styles.underline"></div>
        </div>

        <div :class="styles.formGroup">
          <textarea
            v-model="formState.message"
            :class="styles.textarea"
            rows="5"
            placeholder=" "
            required
          ></textarea>
          <label :class="styles.label">Текст письма</label>
          <div :class="styles.underline"></div>
        </div>

        <div v-if="errorMessage" :class="styles.error">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
          >
            <circle cx="12" cy="12" r="10"></circle>
            <line x1="12" y1="8" x2="12" y2="12"></line>
            <line x1="12" y1="16" x2="12.01" y2="16"></line>
          </svg>
          <span>{{ errorMessage }}</span>
        </div>

        <button type="submit" :class="styles.button" :disabled="isSending">
          <span v-if="!isSending">Отправить сообщение</span>
          <span v-else>
            <svg :class="styles.spinner" viewBox="0 0 50 50">
              <circle
                cx="25"
                cy="25"
                r="20"
                fill="none"
                stroke-width="5"
              ></circle>
            </svg>
            Отправка...
          </span>
        </button>
      </form>

      <div v-else :class="styles.successMessage">
        <svg
          xmlns="http://www.w3.org/2000/svg"
          width="64"
          height="64"
          viewBox="0 0 24 24"
          fill="none"
          stroke="currentColor"
          stroke-width="2"
          stroke-linecap="round"
          stroke-linejoin="round"
        >
          <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path>
          <polyline points="22 4 12 14.01 9 11.01"></polyline>
        </svg>
        <h3>Сообщение отправлено!</h3>
        <p>Спасибо за ваше сообщение. Я свяжусь с вами в ближайшее время.</p>
      </div>
    </div>
  </section>
</template>
