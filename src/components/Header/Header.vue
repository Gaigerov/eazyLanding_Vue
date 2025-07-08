<script setup lang="ts">
import styles from './Header.module.scss';

defineProps<{
    activeSection: string;
}>();

const emit = defineEmits(['navigate']);

const menuItems = [
    {id: 'about', title: 'Обо мне'},
    {id: 'gallery', title: 'Галерея'},
    {id: 'contact', title: 'Обратная связь'}
];

const navigate = (sectionId: string) => {
    emit('navigate', sectionId);
};
</script>

<template>
    <header :class="styles.header">
        <nav :class="styles.nav">
            <ul :class="styles.list">
                <li v-for="item in menuItems" :key="item.id" :class="styles.item">
                    <a
                        :href="'#' + item.id"
                        :class="[styles.link, {[styles.active]: activeSection === item.id}]"
                        @click.prevent="navigate(item.id)"
                    >
                        {{ item.title }}
                    </a>
                </li>
            </ul>
        </nav>
    </header>
</template>
