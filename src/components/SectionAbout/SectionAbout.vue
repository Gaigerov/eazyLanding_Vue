<script setup lang="ts">
import {useScrollAnimation} from '../../composables/useScroll';
import styles from './SectionAbout.module.scss';

useScrollAnimation();
</script>

<template>
    <section id="about" :class="['section', styles.about]">
        <div class="fade-in" :class="styles.content">
            <h2 :class="styles.title">Семья</h2>
            <img src="../../images/DSC_7452.webp" alt="family" :class="styles.photo"/>
            <div :class="styles.text">
                <div>
                    <!-- <h1>Семья</h1> -->
                </div>
            </div>
        </div>
    </section>
</template>
