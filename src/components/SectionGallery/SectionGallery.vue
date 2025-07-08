<script setup lang="ts">
import {useScrollAnimation} from '../../composables/useScroll';
import styles from './SectionGallery.module.scss';

useScrollAnimation();
</script>

<template>
    <section id="gallery" :class="['section', styles.gallery]">
        <h2 class="fade-in" :class="styles.title">Галерея</h2>
        <div :class="styles.grid">
            <div
                v-for="i in 8"
                :key="i"
                class="fade-in"
                :class="styles.item"
                :style="{'transition-delay': `${(i % 3) * 0.1}s`}"
            >
                <!-- Изображение или контент -->
            </div>
        </div>
    </section>
</template>
