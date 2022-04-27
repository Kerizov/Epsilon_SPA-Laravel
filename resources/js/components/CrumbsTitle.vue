<template>
    <p class="crumbs__subtitle">
        <slot name="subtitle"/>
    </p>
    <p class="crumbs__title">
        <slot name="title"/>
    </p>
</template>

<script>
export default {
    name: "CrumbsTitle"
}
</script>

<style lang="scss" scoped>
.crumbs {
    &__subtitle {
        font-size: 24px;

    }

    &__title {
        font-size: 48px;
        margin: 10px auto;
    }
}
</style>
