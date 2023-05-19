<template>
  <!-- <img alt="Vue logo" src="./assets/logo.png"> -->
  <div class="area">
    <ImgView />
    <LoginPage />
  </div>
</template>

<script>
import LoginPage from "./components/LoginPage.vue";
import ImgView from "./components/ImgView.vue";

export default {
  name: "App",
  components: {
    LoginPage,
    ImgView,
  },
};
</script>

<style scoped>
.area {
  display: flex;
}
</style>
<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 20%;
}
</style>
