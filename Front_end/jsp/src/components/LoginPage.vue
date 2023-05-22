<template>
  <div>
    <h1>Test page</h1>
    <h3>{{ msg }}</h3>
    <form action="/Users/sung/Desktop/jsp/jsp_simple/Back_end/JSPLine/src/session/LoginProcess.jsp" method="post">
      ID : <input type="text" name="ID" id="ID" /> <br />
      PW : <input type="password" name="PW" id="PW" /> <br />
      <button type="submit">Login</button>
    </form>
  </div>
</template>

<script>
export default {
  name: "LoginPage",
  props: {
    msg: String,
  },
};
</script>

<style scoped>
div {
  flex: 2;
}
</style>
