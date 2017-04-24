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
			margin-top: 40px;
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
		p.query__title {
			position: absolute;
			top: 40px;
			left: 40px;
			font-family: monospace;
		}
		p.output__title {
			font-family: monospace;
		}
		td, th {
		    border: 1px solid #353752;
		    padding: 10px;
		    text-align: center;
		    margin: 0;
		}
		th {
			background: #353752;
		}

	</style>
</head>
<body>
	<div class="query__container">
		<div class="query__inputs">
			<form method="get" action="query.php" name="queryForm">
				<p class="query__title">Write query here:</p>
				<textarea rows="15" cols="30" name="query"></textarea>
				<input type="submit" name="submit">
			</form>
		</div>
		<div class="query__output">
			<p class="output__title">Output:</p>

			<table>
				<?php 
				$param = $_GET["query"];
				if($param) {
					$db_connection = mysql_connect("localhost", "cs143", "");
					if(!$db_connection) {
					    $errmsg = mysql_error($db_connection);
					    print "Connection failed: $errmsg <br />";
					    exit(1);
					}
					mysql_select_db("CS143", $db_connection);
					// $query = mysql_real_escape_string($param, $db_connection);
					$rs = mysql_query($param, $db_connection);
					$i = 0;
					echo "<tr>";
					while ($i < mysql_num_fields($rs)) {
					    $meta = mysql_fetch_field($rs, $i);
					    if (!$meta) {
					        print "No information available<br />\n";
					    }
					    print "<th>$meta->name</th>";
					    $i++;
					}
					$i = 0;
					print "</tr>";

					while($row = mysql_fetch_row($rs)) {
						print "<tr>";
						while ($i < mysql_num_fields($rs)) {
							print "<td> $row[$i] </td>";
							$i++;
						}
						$i = 0;
						print "</tr>";
					}
					mysql_close($db_connection);
				}
				?>
			</table>
		</div>
	</div>
</body>
</html>