<!DOCTYPE html>
<html>
<head>
	<title>Lab1A</title>
	<style type="text/css">
		* {
			font-family: Avenir, Open Sans, sans-serif;
			line-height: 1.5;
		}
		body, html {
			margin: 0;
			padding: 0;
			background: #0e0f19;
			color: #fff;
		}

		.query__container {
			width: 100vw;
			height: 100vh;
			position: relative;
			display: flex;
		}

		.query__inputs {
			width: 50%;
			flex: 1 1 auto;
			background: #151623;
			overflow-y: scroll;
			overflow-x: scroll;
			max-height: 100vh;
			max-width: 50vw;
			padding: 20px;
			position: relative;
		}

		.query__output {
			width: 50%;
			flex: 1 1 auto;
			padding: 40px;
			overflow-y: scroll;
			overflow-x: scroll;
			max-height: 100vh;
			max-width: 50vw;
		}
		
		textarea {
			background: transparent;
			color: #fff;
			font-family: monospace;
			padding: 20px;
			line-height: 2;
			font-size: 18px;
			border: none;
			outline: none;
		}
		input[type="submit"] {
			padding: 10px 20px;
			border: 0;
			outline: 0;
			border-radius: 2px;
			position: absolute;
			bottom: 20px;
			left: 40px;
			right: 40px;
			width: calc(100%-80px);
			background: #0e0f19;
			color: #fff;
			font-size: 14px;
			letter-spacing: 0.15em;
			text-transform: uppercase;
			text-align: center;
			font-weight: 500;
			cursor: pointer;
			width: calc(100% - 80px);
		}
	</style>
</head>
<body>
	<div class="query__container">
		<div class="query__inputs">
			<form>
				<textarea rows="15" cols="30" name="query">Welcome to query.php
				Enter a query and click submit to execute it
				</textarea>
				<input type="submit" name="submit">
			</form>
		</div>
		<div class="query__output">
			<h1>Output will be shown here</h1>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
			tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
			quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
			consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
			cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
			proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
		</div>
	</div>
</body>
</html>