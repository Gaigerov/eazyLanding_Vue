import {onMounted} from 'vue'

export const useScrollAnimation = () => {
    const initScrollAnimation = () => {
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('active')
                }
            })
        }, {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        })

        document.querySelectorAll('.fade-in').forEach(el => {
            observer.observe(el)
        })
    }

    onMounted(() => {
        initScrollAnimation()
    })
}
