<template>
  <div id="search">
    <input
      type="text"
      placeholder="搜索商品"
      class="input"
      v-model="inputValue"
      @keypress.enter="search"
    >
    <button @click="search">搜索</button>
  </div>
</template>

<script>
	export default {
		name: "SearchInput",
    data(){
			return {
				inputValue: ''
      }
    },
    methods: {
			search(){
        this.$emit('search', this.inputValue)
        this.inputValue = ''
      }
    }
	}
</script>

<style scoped lang="stylus">
  .input
    border none
    padding 10px
    width 20vw
    font-size: 20px
  button
    border 1px solid
    border-radius 5%
    margin-left 10px
    cursor pointer
    outline clear-after chocolate
    padding 10px
</style>