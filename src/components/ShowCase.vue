<template>
  <div class="showcase">
    <img :src="src" alt="">
    <div class="buttons">
      <button @click="handleFav">{{favState === true ? "取消收藏" : "收藏"}}</button>
      <button @click="handlePurchase">添加到购物车</button>
    </div>
    <Modal
      @cancel="handlePurchase"
      @purchased="handlePurchased"
      v-if="showModal"
      :src="src"
    />
  </div>
</template>

<script>
	import Modal from "../components/Modal"
	export default {
		name: "ShowCase",
    components: {Modal},
		props: ["src"],
		data() {
			return {
				favState: false,
				showModal: false
			}
		},
		methods: {
			handleFav() {
				if (!this.favState) {
					this.$emit("addFav")
				} else {
					this.$emit("cancelFav")
				}
				this.favState = !this.favState
			},
			handlePurchase() {
				this.showModal = !this.showModal
			},
			handlePurchased(){
				this.$emit('purchased')
        this.handlePurchase()
      }
		}
	}
</script>

<style lang="stylus" scoped>
  .showcase
    display flex
    justify-content center
    flex-direction column
    align-items: center;
</style>