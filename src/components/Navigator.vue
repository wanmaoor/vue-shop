<template>
  <div id="nav">
    <img alt="" src="../assets/logo.png">
    <SearchInput/>
    <button id="cart" :data-cart="purchaseNum">购物车</button>
    <button id="fav" :data-number="favNum">我的收藏</button>
  </div>
</template>

<script>
	import SearchInput from "./SearchInput"

	export default {
		name: "Navigator",
    props: {
			favNum: {
				type: Number,
        required:true
      },
      purchaseNum: {
				type: Number,
        required: true
      }
    },
		components: {SearchInput},
	}
</script>

<style lang="stylus" scoped>
  Width = 60vw
  Border = 1px solid red
  Center = 0 auto
  button
    border 1px solid
    border-radius 5%
    margin-left 10px
    cursor pointer
    outline clear-after chocolate
  #cart
    background #0099CC
    position relative
    color ghostwhite
    &::before
      content attr(data-cart)
      position absolute
      right 1px
      top 1px
      width 20px
      height 20px
      border-radius 50%
      background #FF0033
      color #fff
      display flex
      justify-content: center;
      align-items: center;
  #nav
    img
      max-width 50px
    width Width
    margin Center
    display grid
    grid-template-columns 20% 50% 15% 15%
  #fav
    background yellow
    position relative
    border-color yellow
    &::before
      content attr(data-number)
      position absolute
      right 0
      top 0
      width 20px
      height 20px
      border-radius 50%
      background #FF0033
      color #fff
      display flex
      justify-content: center;
      align-items: center;
</style>