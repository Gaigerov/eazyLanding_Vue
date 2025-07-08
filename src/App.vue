<script setup lang="ts">
import {ref, onMounted, onUnmounted} from 'vue';
import Header from './components/Header/Header.vue';
import SectionAbout from './components/SectionAbout/SectionAbout.vue';
import SectionGallery from './components/SectionGallery/SectionGallery.vue';
import SectionContact from './components/SectionContact/SectionContact.vue';

const activeSection = ref('about');

const handleScroll = () => {
    const sections = ['about', 'gallery', 'contact'];
    const scrollPosition = window.scrollY + 100;

    for (const section of sections) {
        const element = document.getElementById(section);
        if (element) {
            const offsetTop = element.offsetTop;
            const height = element.offsetHeight;

            if (scrollPosition >= offsetTop && scrollPosition < offsetTop + height) {
                activeSection.value = section;
                break;
            }
        }
    }
};

onMounted(() => {
    window.addEventListener('scroll', handleScroll);
    handleScroll(); // Инициализация при загрузке
});

onUnmounted(() => {
    window.removeEventListener('scroll', handleScroll);
});

const scrollToSection = (sectionId: string) => {
    activeSection.value = sectionId;
    const element = document.getElementById(sectionId);
    if (element) {
        element.scrollIntoView({behavior: 'smooth'});
    }
};
</script>

<template>
    <Header :active-section="activeSection" @navigate="scrollToSection" />
    <main>
        <SectionAbout />
        <SectionGallery />
        <SectionContact />
    </main>
</template>

<style scoped>
main {
    padding-top: 60px;
}
</style>
