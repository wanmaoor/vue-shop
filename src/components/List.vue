<template>
  <div class="lists">
    <img :src="img" alt="">
    <span>数量: {{count}}</span>
    <button @click="cancelFromList">取消</button>
  </div>
</template>

<script>
	export default {
		name: "List",
    props: {
			count: Number,
      img: String,
      id: Number
    },
    methods: {
			cancelFromList(){
        this.$emit('cancelFromList', this.id)
      }
    }
	}
</script>

<style scoped lang="stylus">
  .lists
    border: 1px solid #000;
    display flex
    justify-content: space-around;
    align-items: center;
    border-top none
    border-left none
    border-right none
  img
    max-width: 40px;
</style>