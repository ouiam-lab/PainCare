<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up Form by Colorlib</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

	<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAACoCAMAAABt9SM9AAABUFBMVEX///9JAS9GACvXAADaAABFACrUAABIAC3KAABEACjfAADPAAA9AB0+AB9BACM6ABg3ABIwAADEAAA2AA/b0tfu6ezjAAD9+fnFuL8qAAAtAAD54eD99PP++vnz7/L49fenkp7UytA0AAmwnqjo4ubRxcy6qrOFZnd3U2eXfozmeHbhfX733Nv46+vvcWf50c1jNU8hAACQdIPuhoD10NB9XG9XHkDbGRSTeoj1sKv2s671pZ/rwsPjoqPli4vst7fSTlIbAADckpTYXF/MIydrQFnkMiftkIzja2rRFRheLUn3xcHvfnbVd3n61tLPYmTiPjfQPkHkrq/tU0XvZVjVMjTsPCrzmJDZKijoKxXKSUziX1yvjJrwhHyhaXVsCzH4e2/OqrKlWWdcBS/LJyvuWEqoeofOfoSGOU3eT0zjZGE8ADFrMVWwaHRSADjdQUDvV7zwAAAZ3klEQVR4nO1d/VviyJau8J0QkgAhRAkQIQSCRGnkQ0XEUVEB27Y/1fH27N27sx86u+P//9ueqkog2I7dd3fGbpH3eYSkUhSVl3NOnXOqUiK0wAILLLDAAgsssMACCyywwAILLLDAAgsssMACCyywwAILPI7xNnmrpeFF+75d+fHR5Xbw2+k+vGx1v3NnflRoNfq+zUWa8PY5ksHE7X/XPv2wWL+yybvGRV7DW2YPTsdcZMHWQzhTolS2mqv2pPAo8gbZ93Uxm37Cbv1ooNxklcjhtGydvqX7GqopE+kiLNmH2Sfs3I+GI8rWOPoGLBYdC1H3HBsuwpmtRF/Twtoqfj0f0pN9G708aMoJPcByc8a9Jf5CJpAAA4+UXZCiD9EEVbw1LHrrXAKztAEK+gKRUSL96dltgngOaPwaK9sppiS720dE4D5FdrDRx2SNlSiut/P6pYnXFRn+HNOFMp5jlF2l1KH3u/CyFnkHrxvYhHUVrIzXkd0n7ekPgMwu4eZ0e1p0sUEceCiRacH7aA+o25lUyG5hN0yJ1J6yo98X2Q+egGY9hK3QMTFP64EEXMlwtbxJL3aj1KzveCOgrvIRYa6bT9Pb741P/t70ZPctvCi0YPXQxv7poWmiD4SLHnntRmY+PgbqtkK/PlFnvzc2/Il9lJ1IiwzWPpqZXJXH2xUTrYUOiZr2sS8GfDo+apbatYwSmm8n/6LbdzQne5foIXuDHMKfntOUyAEynHq533WxiLTLRBOKNg6g5LSPtAD5bDNByTpTQvM9IIL4JFwvCWtbKANuOT4xBjDivckRo45VbGVJsGgdS1P2UCmHy7k9XBQYOn78mHL37onv4ekwDiUOPKfgi58nyFFdRSBFJXy4pRz0UCVWhtpg8y31Q29Tx+XbHHZXLwJDb4NrkR00fxhniECkQRy0teshuEkZbKPGAapVpSUQHlXFh9mrUOKNnGQgHAKpUduoHCYtaFe4ajfw1tPqthJ94vt4EmQmgR4w5E/8jEO/g51SF0c3GtDGVBAqErLQGZCFfHFgDaIdY6kcL6JrXP43au7hNe2mH8bKfBr5ZhQEI7NeI2NeE9/t52hC/eUIBOUSxE19ZaKGjsgIicWvUpBBReGAESTD9u+gFYFYNKypmSFU2iENzWseIp3BKhZNTGQh3+uhtoodJuxi1eP5CtipSxAcc1PNNyQd2Th0LAtsPhNY1V/p+CMDbOqPwGxtJybSdR3pfflt8wDtYOha5LRcLOvleAl9CIFSIjleqQfB+cRj3MqyxLB1MFAgQaYI1qv/L6KQB658K3B1XQGilIjjpI2V0Or3uZe/CKeZB4uz6SIfK5T+HhridFZDDCeN8ygRPIP3hUUDnYKcGVI4jSriAKQO1fEL+Pd7YPASDlmfldB8JVBP/W8nDqSmZZFKfAQ0/mAjS5J+uemhC38NhcPC5qfoz+SSwYdjOpSCF8aIuXKygiBW1PGQedIkhqrrqp598fAv8Wxh+xMTs6JdDYd9vYKddfDae0hmpFYebfnfopVC+LfVqFOxlPS1kXa3h9BAqMRYbKpySw2c+yO062Dm50ugprDfkTvrYyYyQ7Dx1nJFTaNudA8KWpJopW7A8BRjbIVU70FtnZdUIkOWEJSIT2Etyzhhj5MzsoX6ntB6/S7y63zFPtr4LkKzoTXZtIKsKLbMf01hEsuskKzoqqq2GR6EBwQRa9ZIGKH1NWAtFqyTBkDUcMIQ26q2bHPTWQ6IqYfzMYeddlN79po/8nMWyXpdWI4XRIAkxcRwe9RuM0yY5SVJDDOMiMOcAPZf5YJUWucOkC4k8RiI5GUcLmpYgqw21AHJKhkajsxrin9ecoHvubcTg2VYyVfJdssqqisrK2pxk2XC4aDASzxwNmozwB0TGxk1GtKUY+00l9ixYlSwzOUSsknwbP6kIvtoH5ntrOLHqenM3OjgGRdJ0MSM2WZbpoxtNfpw3NNQru5jWDFWKcopWjVfaoeZYMHqk5s3RF7P7KOBRJOmjWUDneMcQyk+wOepSjKlXd1NZKr5bh5UsfnxZ2yZiuWiMSnbhvjPYFmhgO28i5QV9jEAgdHJeYtNyijH84ReNFhGGayfJSkG/qlcXl6u62pq8uHP8+SbukSlt0k8t7P7S0yQyoanQiuOzRiYLiHIx4pQUhLDPqSLFZTB4wIroixIVjEu6GY5ybeKKylv+59PnuhGnhTv/Xt4sLP4JHG2UPYMK53ciheEsrlipAzVakusyIC7IDLsIMwX0QcQGqMQxLXLUji2VNeNmSazc2Ozjru7u97Bysbpd6Muic78DTpJZPKNJN82pwpZGom+ZAs1WCbISDL4CzYy+RiUwxjA6I5E2ZPJndPQvKQA15UoXfmhfei+w6xpO2m9INZJqvj44A0UmBLP/mNWOopiWGAsASxYIQ+e/j6qByWjUgi2VbfGGMfc6d2DtJOosd/7I2+evYjVrg9povzCHyELGUyQjxYpyd5GEihXkYLt1Pu3s5+SY74wi809j5PHPTkJPhicB9tWKU8qkCTph6lMXSj+w/48DIgOLjq/pmWL5cPiplukoRWWDf5bE/XvkYVjacwV8dtrqI3HSR8LiEnCQC8ZaGsMF06r8HJG6ttrczKlD6qSMi29uNniJSHMiDio0ewaVkp1ifWNjqM2mohIyjRpUlTCZAWJU1URGEES6pVya9D+jRUEMQm+bcPSTVM1xoHDORIo0Jbb1R7Km3U+SPwoEi6nP0UhVDSXRoO4kT2cWmiwZ3yhglXNikFlHFun6kBPw1E/7c0v9aSP8VkWcFXCxt52c/Lj/nO3WXhap8ZFE2C3UgMQCjA7zpX911ppaYDqOtzv5C7VOOFzhI9jYSxZOYsXkps5t8I2hNClNh/Tv/imDSXy+pkn5c+Ujz1U23urpRpLBUbXBXHqJOWWQG6Au+x0iQdDnHiGxDhFLFq+JBAsT9uzA3iq0ZLiJTS+PfCK0vrJ888DdiPEdm8uSY0VoEbSp5fqECOni3ilpKuGRoFwRbQPpYjVYoR63tvePlkQoiZ5WQk1kb1xuz8fJmv79CZygLQsyltLFZVkV8QRvYTX7plJbGzw3507Cy9Tfpjw7/hsgG0cO5ptFAc/2k1/Jf7bPkjSmhLd23HyDtnu7nPO1axFI4k0yut1M4/OEzZaidPklL2GE4H8RLuarjq5ZNGEH/ZKw2zuy3bHgV+RWQjKOJHfR+jfAxG8JPWzEoocPGOr1ew18+Z//Ccc1UKJWt4ZCcGSvWsi03rgA/EwVT1yzeQZJqk+UOsscABxIu9kbzQlsIpVcUu53N953gOigW7wfMU4tIcGrOQx1Q5voIKnU4+0IRCyCmQUALLYwUNtagGsb4yv0CLmLPP8LTtgJ/IzmJIA9hvWVlEr5r31fJG8Zf09tJWYlKZEYt/JDCEq8gxV2/vAQbTdLBUqg7gTjz9j7XOghSIwdGX8eJ1RFjUkRnR1qtlzl9jaN/DiWYik89hzoBcbQvCedffgOIIGYWSYOrZpNQVPda9fP9/lWvan0FtQkK0tctZaHgRj7pUoXWqkHXy5iJYJMz6HopFvksj5Ett7SH7lkg+RYS+LjrnL57vuYeqYo3y9nCsL/6WQ5K92PqQicJz4cs0Q6B4NCCE6DLN/PJV6Bja9QtR13HVt1nOfeH1HCEurOZSPi+p2D9/X5Pkubu/L2zOSYLOwaqWZsPDQgDmBfa4uIzxvGJiPBYCZy8kqUqTHRA81zUMb2Q+MYulcEqet1BWTYZlk/ssKU5xFM20YNbP/HqBaPX7ernztU/SQLmc/QOkwO1ifsnWTeGjNf7HOk+EwzIt8mJGKj7Zu36IiWWOiaZkaeRb2OTvwyLUiXQimi3zwH0rEtWJn/gdWOBptMchMEas83ja4C3nd81Vb+88//0ddoHxMENWs5mpK5gHHSI57qQomW9/QuPz1Ks8JVZJ4R422tWw8WjEVC0+YYvlC/aE4Z75xdhQhE9KylC8ld/qPVR2wTsZBkNiymXqs6qT1u0dbfHawieLl67Vd47dT/yOPoaoSE2wAXwKrG0jWy98iWGv+4dcrPTuYqBtJBx+t0vb56irPSGWUawhSTIg/6jZQHPsPv17p+SCz5/hSGzX0349VXEkysWJOEnVUTArYeMUfyGPdxzj0+uuVng8uE1Pn2lp/JNlUFph4CpVHqEimLNhk+Rtat/3PPcDxYsOJbDUcDJrn92dSXdTsNBvGEWHOpIl3cfDHEbQH9vNO9f0Brvc07BPtzRRmz5wDLZApiYyzzhZP6cTmzH36JtjD10jbPiTpKq12zwjZn7krukPIzbVWZn10PnGE58IeSWPNLexhYhd1A3RLgi28GJvzpAc2jo463HEt0z8fVm2BEUkgmBY9aeUXhfUtEizTyGYdp0RvvMm5qr/T8fv9oVAGmRA2k7I8Me+MWHrqvv5Y0DTtZDrnhdH1d0NDAH7oJOzM1CBfeEpWbb2WOXOHUCeqTI/PoIwe2/2LjeMtTyoDrY897WePnUJohqBGr3ancekYLq2v3+tppt/d2LjYGtvThjcmR81mLVNrNpuT4La547b+Z0YTNrqbLeiH9vej0WFkFZkiW3cKLZ5M35N5Cq2vKErf6ZXisJU5UjYIf7UP3PVxt8pxXHWSyOoeedrfUpwvXoc6CvxxtAM3N5Mqmb7CdWeH1PF75dPni4vTK0X55JbVuMmPYI8DgcDlnT/UcVIcdhN0IxSKRqN/YjSxHUHaVnTGL7qM9nb2Dw61vOCTHCOVRwM8GSY6kzprV4rTzXXF3U/r/RV563J3mnMQ4FzhqHIe0Tri3KPbDocZWSePxKJr7npa6Y6bTRn+XfnkZMXOjs7dwio35RfdhjrwuhsKua2sRsk+C829R+//n8IW/BJ2ZOZXtH9NAJoQQiddt6pgogE4D7wTGY6VK0cDTq8codEUUtLlJrcy5jqc44XcXU1KUZ/j3EzsyRUhy9kb4qbDTdc238yStaZ8mpxnJmLKdQLTjp+EOljYb6MhJ30JZBF+/8RnkG1UW03fn3xp9vZRryhKbq69KBZKqM4yguO/ZxWHo6zScWRsrGBiapxHho65zpF7V9Pio+lxlUqWg5tAh6u6J9cBb2ZtS1E8ornmvG8HOv5pXtEhaycUcu7GJetPxdpDO/lltH+IUsM9Y8JhCRlimJHcz1xR8djmOlcfnBL8ehvoeBoBjoh1tblOxzWMIG8BV3Orfi9Zd7eXU7auO17LcHXlNXqu03xerYamX3cSIntLZKLRv5Ks08j98UJWe/9TFwq6e66ClxXTUYt1LDyWI47c8fuNjSuF0KZcIPw4a+eDp52q309u/ixw1wk49uvuuuPfmFwPeMnasAOdgHPtxEv6mLs6/bLftVATxGjS9ylZDkV/DVk3s+fqCiq1Y1J4OkOP83/gcJk8406Cpa+u8Kds7qxGzdc6hzs25vwbnpb6gQ6xVduBda5Dv2U9kDnvuF/okJWmLvF5FVh12Zoh6zjAPbBFatWPstGJOUcnUULWOOoavtUIMfDZP3U+bvt+gf77gG17ZnByZCmbZBgS43MXU55cYZ/hArTjfQe7AhtET7qBwLGnoWagc4nfdwMw8NFNa+6u0XXI1SnQIhjwA346N35+Qj5B2ap6yQJSvyRLC4G9WsWus9Mj6iO8/egau9XIEByH6F+9C0A6NZM9LpFYR1TTBSYsOlfGigIkd+AewCWCIw5rIZDl9z7YVHPIuj7Hh1iemoEzfOvOyFYFBsGVvKWqdHmL2wW2MN+rM2SFHiBrKwpSWYuGXBN/Euns9/sHd5OBASRrB1qvPm2Ku0gcUt5EEPNIbsCjXN2iJhnfr0DXMtTe9wMdr06DnBC7jmm46QBPxPEE8XNsCZCA1TBDR7pLolFjf8cPbB17XclVf6iK7uPjR3DYa6FhyDk/iQxPDi6j06dnVyNkwjLztGThlX7BMJBVIJQ5fbtSUJXc3jHH1RwXHeSn4xnyx1QrtcAuIe4a1fxNzGjA6b9DljOLeUl5xmztol0vWX0/lVAvzqIfDzGGUacxIAtaGkYm8chqgs7uPm0iEshiW6yoItFD1hg8KuowZbirjQ8XtPSoE/DYU5AhbKgyxCjddfyZE3wntYCrVC5ZFEPnNjFbW/tedrRQJ3R/orwapc8GRYd7tADIAlqakagrhI5kPTE2BeDIipdmyEqDx+kY6utOx3XKuzN6eOcnJ2MsT2gHdDKA2bUDIWfAOukEPMsqOq6Xj9n6+NHbg9VQx3OO91vXXE6uO46DQMlCuxHXbXQl62kBkhXTjVcGYsNTsnCs4ojT+sRThyFt6nKipuNG9chz+2C1HDqGLqEnHXolSyR0qmo7oU5nhiz0MRqahkL4qBdxRK0fjdIx5SRByEJvh87inQlZT2q0wMALDRTPI4GZLhLEeujq0JFLG/ziHb+7y6Ld8dMbqvqJxjT9fmrJ7zrOUHft1GgS78Xvn3zjONSZTYVol9HotfN1O5jHj65Nyw6HUWLTD4Z0Ixw7MqREVp332pNuUAWuA9tCEBYWJislcS+5W/ewy021Sbv1++/6GS3T9d85pZfOgHXjiM6ty9ql33+539vaJQbJDnm2C9wJ3csboV1wmU76zWb/BG8d24tMhkcwTSQ/fuiaqFokQrab/TWSONx/927/aVeJpQqYrBRxTmPTjP3txCJo597qtdW7ALBQdeKb5upJtUpUs0Z7nd1drd4e99EOvnByfQNIo2y3Cie7k3F/515YAV/SO/mIncy7qr2ze1A9cXe+3j05Oaj2dnbfrFaru+Tn0fbfHFT3oWD1zcEe4GnXh7XDLF46I0uTZaVfQTb914zX0O4Pv/55UyAxIY4N9e/dlx8eKxIZBFvszPROKkeXPeRT5D1n0GsQK6XcCmmUmwRO6VTOuZA2jLRTYXZRDi1PpXK0Zo5+QZ7uxjH9uFsdvpHss5RyLuVzObd9WoF8PJV64unxdgHsOp6drnsKjQK8NPAmIfhMN40S3eWgoZfIvnZILaN0ZUqH3iiRBFlJl2W6GEdtrVQ8Tx9YMtm50iqVLRXXTJHHqgzdIKkOtVKiT/gXnYjLUuWVMvRLV/VKycLfyBiz7Rd1/PlvWXz3Z8IspElWa/bZy4GB5GQKlfD9mlj00jwu1leQSerJFtr0VC9SF80g2daRTCsYU/pzk+WXzgaWaXKt6NApu2nbBq1nkXGZ0CM7WcpBftJ+G1816zh38ujS6r8C+AsHwXvzhsUi/lXxFmPQOSJLLXwdyCqSG5HL+kx1PYVvzaJChWnEZHmqtNzMrE7JyhOyUgI9kxsp0uqKTAU4PP3gDFmbpDp5XKuYw2sznpws3KOk18vCSA1QEbUpWSIhi3RUbxDxh09UZp7fNK0V/ENTDSnh318emDOLeS2G1p8hC6UY0pzckv+G3xuyTm4/6emal6wy+UGJHhdTaKR+F7JGwftkoYGeR2WqJhXSRWKhQLLaxLjIuvG7hy1HDU2imkTTQLIaM8tyHJZnyUK0OUcN85uGQTKQo6m1myGraE3ax3sStUv6/+1+/z8oip55Qwd6GW+LQQ4NrIe0X3oJ5RgsaHB7MjM18EUn+YrvMkesrgy8jSaaLeeQTKvolME0IQXuukxao4xgAix83cCPaKccfXdaJj9Ne9I+2cCpPpl2eTIYopMAnCkkVpQep6yiSe8bS5BhQT9VEDzDmghjseiIma6b9EOqnkNpy2UrtWkWZ2rKDXyzpk5lVyUDXsoC9o0G8Sx0S6cDCL2Eck5Tk/aJeKWffHl1vk3WwrNPPQw/S4yc9d2Fb1h++8KRHwnOUwPC5tdrv2yk2qz7iEVYeokrJf8JGGGHK5Zsb7RQxEewwjvPOcVMsmVP/esfebEoJt3nnJI54msJD+5SsAB27vD6d75NRsI0Ig6EUP+GhyxeIIoiHgZjpVHYxzISTjJgMWPFJ/fzfnyobeq2qyuir94K4l1KdfKgBStVFoOiF7liW/ThpwwFEY18yRWVJytoWmDk260Cn2w9uGcIRHet1pwvljfupV4Ns1Lg8TMVgmA1WjovlPEUD9E+8OXZlmEJhXjY3UHS/VBJHyyx1tzLnNFgmUpZLxZNs2iVB3ycp66V2MqDMsbC+P96sOEwk0ZksaQA4b1ZkeLLy0ylVW40GuVWpb0Ur2+q3/Sg6/NHqlRstEa///77aNDaLFPXimyar4rhAla5Fkv3myzjfUlx9jJf0hut+u/C8lI8GROKc658fwizzfJS2PGo6kGaebcEtvzTCknFC0K40Jr6D3nZrPCPbE8zx5A3BTE5Mo2SSJK85RjDEtOkx5J5kwE9lGJFixeEmO61WLnS5uZLC4Rky/dK5BmcRGssY1PdEMNhuo7U5CGIThkoXQBJy5WT4ZjQmHtj/sfIF9vthmnoNA/LW1BS4YVRkD4YZtLt4IEssqekKTFhPh4rmyup/Dw95PutyNGpZTqilQogZ2CdyoZE1dDk6b+USSUZMrGiSsFBKxgXxUIBb5Px9JnuHwgNE+lJkWXxHqaEPl1kyRIaWWLpowN6AQgq1aU2OBzqC1ZIQFttS4I6AF3cjBNuWla5gEe8klh2nukZkXnOou/7dfIHQSkpxtopNNDx/88ktuqVnFoixsqHGGrF5J/oFPFL9bAcyKMlpj4A7avocCZif6sEBFlLwEtxgNRXNDBsvEjf6h5yquH4TJtY4fQlTBsQkxd1uopgRM157nvMjP+4UPFcb5rfdKbSzWX8yBieDaaXF1lAL9JkYtz8KUW9ClRR6RKx0guJmP85UONdmXhRC8X7Oipu3PcSnfUFFlhggQUWWGCBBRZYYIEFFlhggQUWWGCBBRZYYIEFFniW+F9ithn0bxNJWQAAAABJRU5ErkJggg==">
						</figure>
						<a href="registration.jsp" class="signup-image-link">Create an
							account</a>
					</div>

					<div class="signin-form">
						<h2 class="form-title">Sign up</h2>
						<form method="post" action="login" class="register-form" id="login-form">

							<div class="form-group">
								<label for="username"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="username" id="username"
									placeholder="Your Name" />
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="password" id="password"
									placeholder="Password" />
							</div>
							<div class="form-group">
								<input type="checkbox" name="remember-me" id="remember-me"
									class="agree-term" /> <label for="remember-me"
									class="label-agree-term"><span><span></span></span>Remember
									me</label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />
							</div>
						</form>
						<div class="social-login">
							<span class="social-label">Or login with</span>
							<ul class="socials">
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-facebook"></i></a></li>
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-twitter"></i></a></li>
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-google"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	<!-- JS -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="js/main.js"></script>


<script type="text/javascript">
    var status = document.getElementById("status").value;
    if (status === "success") {
        swal("Congrats", "Account Created Successfully", "success");
    }
</script>
</body>
</html>

	
	
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>