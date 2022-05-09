<template>
  <p>ddd</p>
</template>

<script>
module.exports = {
  props: {
    articles: { type: Array, default: [] },
    panier: { type: Object }
  },
  data () {
    return {
      panier : {
        id: 1,
        quantite: 0,
      },
    }
  },
  async mounted () {
  },
  methods: {
  }
}
</script>

<style scoped>
</style>
