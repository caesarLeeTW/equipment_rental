<template>
	<div class="nav-container">
		<b-navbar toggleable="lg">
			<b-navbar-brand href="/">
				ER-store
				<!-- <img src="https://placekitten.com/g/30/30" alt="Kitten"> -->
			</b-navbar-brand>

			<b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

			<b-collapse id="nav-collapse" is-nav>

				<!-- Right aligned nav items -->
				<b-navbar-nav class="ml-auto">
					<b-nav-item href="list">List</b-nav-item>
					<b-nav-item href="rental">Rental</b-nav-item>
					<b-nav-item href="add-equipment">Add one</b-nav-item>
				</b-navbar-nav>
			</b-collapse>
		</b-navbar>
	</div>
</template>

<script>
export default {
    
}
</script>

<style lang="scss">
$color-er-green: #e8f5e9;
$color-er-green-dark: #b6c2b7;
$color-er-gray: #E1E2E1;
$color-er-gray-light: #F5F5F6;

.nav-container {
	width:100%;
	position: fixed;
	z-index: 999;
	left: 0;
	top: 0;
	.navbar {
		background-color: $color-er-green;
		border-top: $color-er-green-dark 20px solid;
		.navbar-brand {
			color: black;
			margin-left: 25%;
			font-size: 2.2rem;
			&:focus {
				// color: $color-beseye;
			}
			&:hover {
				// color: $color-beseye-hover;
			}
			&:active {
				// color: $color-beseye-press;
			}
		}
		.navbar-collapse {
			margin-right: 25%;
		}
	}
}

</style>