<template>
    <div id="loadingBlock">
        <img src="../../images/loading.svg" alt="#">
    </div>
    <div id="load">
        <router-view></router-view>
    </div>
</template>

<script>


export default {
    name: "Epsilon",
}
</script>
<style>
@font-face {
    font-family: 'Exo 2', sans-serif;
    src: url(../../fonts/Exo2-Regular.ttf);
}

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: 'Exo 2';
}

:root {
    --index: calc(1vw + 1vh);
}

body {
    min-height: 100vh;
    flex-direction: column;
    display: flex;
    line-height: normal !important;
    font-size: medium !important;
}

.page {
    background: linear-gradient(rgba(0, 0, 100, 0.2), rgba(0, 0, 0, 0)), url(../../images/bg.jpg) top center no-repeat;
    background-size: contain;
    background-color: white;
    padding-top: 50px;
}

.container {
    margin: 0 auto;
    max-width: 1800px;
    padding: 0 45px;
}

ul, p {
    margin: 0;
    padding: 0;
}

/*lines*/
.green-line {
    width: 150px;
    border-bottom: 2px solid #97CA2B;
    margin-top: 5px;
}

.orange-line {
    width: 150px;
    border-bottom: 2px solid #F7B903;
    margin-top: 5px;
}

.gray-line {
    max-width: 500px;
    margin: 10px auto;
    border-bottom: 1px solid rgba(0, 0, 0, 0.5);
}
</style>
