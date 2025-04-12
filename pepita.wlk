object pepita {
	var energia = 100
	
	method comer(comida) {
		energia = energia + comida.energiaQueAporta()
	}
	
	method puedeVolar(distancia) = energia >= self.energiaParaVolar(distancia)
	
	method energiaParaVolar(distancia) = 10 + distancia
	
	method validarVolar(distancia) {
		if (energia < self.energiaParaVolar(distancia)) self.error(
				"no tengo energia suficiente"
			)
	}
	
	method volar(distancia) {
		self.validarVolar(distancia)
		energia = (energia - 10) - distancia
	}
	
	method energia() = energia
}

object alpiste {
	method energiaQueAporta() = 20
}

object manzana {
	var madurez = 1
	const base = 5
	
	method madurez() = madurez
	
	method madurez(_madurez) {
		madurez = _madurez
	}
	
	method madurar() {
		self.madurez(madurez + 1)
	}
	
	method energiaQueAporta() = base * madurez
}

object pepon {
	var energia = 30
	var ultimaComida = manzana
	
	method energia() = energia
	
	method energiaAportada(comida) = comida.energiaQueAporta() / 2
	method puedoComer(comida)= comida!=ultimaComida
	method validarComer(comida){
		if(not self.puedoComer(comida)){
		self.error("tengo que comer balanceado")
		}
	}
	method comer(comida) {
		self.validarComer(comida)
		energia = energia + self.energiaAportada(comida)
		ultimaComida=comida
	}
	
	method energiaParaVolar(distancia) = 20 + (2 * distancia)
	
	method puedeVolar(distancia) = energia < self.energiaParaVolar(distancia)
	
	method validarVolar(distancia) {
		if (self.puedeVolar(distancia)) self.error("no me da energia para volar")
	}
	
	method volar(distancia) {
	 	self.validarVolar(distancia)
		energia = (energia - 20) - (2 * distancia)
	}
}

object roque {
	var ave = pepita
	var cenas = 0
	method cenas()=cenas
	method ave(_ave) {
		ave = _ave
		cenas = 0
	}
	
	method alimentar(alimento) {
		ave.comer(alimento)
		cenas += 1
	}
}

//documentacion para testear el commit en el nuevo navegador//documentacion para testear el commit en el nuevo navegador