<template>
    <HeaderOther>
        <template v-slot:title>Личный кабинет</template>
        <template v-slot:path>Кабинет</template>
    </HeaderOther>
    <section class="Cabinet">
        <div class="container">
            <CabinetInfo></CabinetInfo>
        </div>
    </section>

    <Footer>

    </Footer>
</template>

<script>
import HeaderOther from "../js/components/HeaderOther";
import Footer from "../js/components/Footer";
import CabinetInfo from "../js/components/CabinetInfo";

export default {
    name: "Cabinet",
    components: {
        HeaderOther,
        Footer,
        CabinetInfo
    }
}
</script>

<style scoped>

</style>
