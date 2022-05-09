<template>
  <form method="get" action="#/login" @submit="logout">
    <button type="submit"> Déconnexion </button>
  </form>
</template>

<script>
module.exports = {
  name: "Logout",

  methods: {
    async logout() {
      try {
        await axios.get('/api/logout')

      }
      catch(err) {console.error("network error",err)}
    }
  }
}
</script>

<style scoped>

</style>