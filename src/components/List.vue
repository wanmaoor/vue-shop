<template>
  <div class="lists">
    <img :src="img" alt="">
    <span>数量: {{count}}</span>
  </div>
</template>

<script>
	export default {
		name: "List",
    props: {
			count: Number,
      img: String
    },
    data(){
			return {

      }
    }
	}
</script>

<style scoped lang="stylus">
  img
    max-width: 30px;
</style>