Config = {}

Config.producoes = {

	["Ballas"] = {
		-- 2215.7690429688,5577.6293945313,53.83239364624
		['folhadecoca'] = {
			x = 2215.7690429688,
			y = 5577.6293945313,
			z = 53.83239364624,
			text = "PARA COLETAR",
			marker = false, --> does the marker needs to show up?
			receiveItems = {
				{ 
					item = "folhadecoca",
					min = 5,
					max = 8
				}
			},
			recipe = nil,
			duration = 7,
			anim = "mexer",
			permissions = {"ballas.permissao"}
		},
		['folhadecoca2'] = {
			-- 2217.4526367188,5577.3447265625,53.847946166992
			x = 2217.4526367188,
			y = 5577.3447265625,
			z = 53.847946166992,
			text = "PARA COLETAR",
			marker = false, --> does the marker needs to show up?
			receiveItems = {
				{ 
					item = "folhadecoca",
					min = 5,
					max = 8
				}
			},
			recipe = nil,
			duration = 7,
			anim = "mexer",
			permissions = {"ballas.permissao"}
		},
		['folhadecoca3'] = {
			-- 2219.9345703125,5577.1850585938,53.84997177124
			x = 2219.9345703125,
			y = 5577.1850585938,
			z = 53.84997177124,
			text = "PARA COLETAR",
			marker = false, --> does the marker needs to show up?
			receiveItems = {
				{ 
					item = "folhadecoca",
					min = 5,
					max = 8
				}
			},
			recipe = nil,
			duration = 7,
			anim = "mexer",
			permissions = {"ballas.permissao"}
		},
		['Coca'] = {
			-- -332.81143188477,-2447.31640625,8.1620101928711
			x = -332.81143188477,
			y = -2447.31640625,
			z = 8.1620101928711,
			text = "PARA PRODUZIR",
			marker = false, --> does the marker needs to show up?
			receiveItems = {
				{ 
					item = "cocaina",
					total = 2
				}
			},
			recipe = {
				{
					item = "folhadecoca",
					total = 1,
					enabledToReceive = false
				},
				{
					item = "pacote",
					total = 1,
					enabledToReceive = false
				},
			},
			duration = 4,
			anim = "mexer",
			permissions = {"ballas.permissao"}
		},
		['Coca2'] = {
			-- -331.30807495117,-2445.2856445313,8.1614627838135
			x = -331.30807495117,
			y = -2445.2856445313,
			z = 8.1614627838135,
			text = "PARA PRODUZIR",
			marker = false, --> does the marker needs to show up?
			receiveItems = {
				{ 
					item = "cocaina",
					total = 2
				}
			},
			recipe = {
				{
					item = "folhadecoca",
					total = 1,
					enabledToReceive = false
				},
				{
					item = "pacote",
					total = 1,
					enabledToReceive = false
				}
			},
			duration = 4,
			anim = "mexer",
			permissions = {"ballas.permissao"}
		},
		['Coca3'] = {
			-- -329.63360595703,-2443.4672851563,8.1620473861694
			x = -329.63360595703,
			y = -2443.4672851563,
			z = 8.1620473861694,
			text = "PARA PRODUZIR",
			marker = false, --> does the marker needs to show up?
			receiveItems = {
				{ 
					item = "cocaina",
					total = 2
				}
			},
			recipe = {
				{
					item = "folhadecoca",
					total = 1,
					enabledToReceive = false
				},
				{
					item = "pacote",
					total = 1,
					enabledToReceive = false
				},
			},
			duration = 4,
			anim = "mexer",
			permissions = {"ballas.permissao"}
		},
		-- ['Remedio2'] = {
		-- 	-- 318.83819580078,-600.69256591797,48.224128723145
		-- 	x = 318.83819580078,
		-- 	y = -600.69256591797,
		-- 	z = 48.224128723145,
		-- 	text = "PARA PRODUZIR",
		-- 	marker = true, --> does the marker needs to show up?
		-- 	receiveItems = {
		-- 		{ 
		-- 			item = "remedio",
		-- 			total = 2
		-- 		}
		-- 	},
		-- 	recipe = {
		-- 		{
		-- 			item = "capsularemedio",
		-- 			total = 1,
		-- 			enabledToReceive = false
		-- 		}
		-- 	},
		-- 	duration = 4,
		-- 	permissions = {"paramedico.permissao"}
		-- },
	}
}

return Config