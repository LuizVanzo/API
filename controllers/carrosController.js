const { getCarrosPorModeloDB, addCarroDB, updateCarroDB, 
    deleteCarroDB, getCarroPorCodigoDB } = require('../useCases/carroUseCases');
  
    const getCarroPorModelo = async (request, response) => {
      await getCarrosPorModeloDB(request.params.codigomodelo)
        .then(data => response.status(200).json(data))
        .catch(err => {
          response.status(400).json({
            status: 'error',
            message: 'Erro ao consultar os carros do modelo: ' + err
          })
        })
    }
  
  const addCarro = async (request, response) => {
      await addCarroDB(request.body)
            .then(data => response.status(200).json({
              status : "success", message : "Carro criado",
              objeto : data
            }))
            .catch(err => response.status(400).json({
              status : "error", message: err
            }))
  }
  
  const updateCarro = async (request, response) => {
      await updateCarroDB(request.body)
            .then(data => response.status(200).json({
              status : "success", message : "Carro alterado",
              objeto : data
            }))
            .catch(err => response.status(400).json({
              status : "error", message: err
            }))
  }
  
  const deleteCarro = async (request, response) => {
      await deleteCarroDB(request.params.codigo)
            .then(data => response.status(200).json({
              status : "success", message : data
            }))
            .catch(err => response.status(400).json({
              status : "error", message: err
            }))
  }
  
  const getCarroPorCodigo = async (request, response) => {
      await getCarroPorCodigoDB(request.params.codigo)
            .then(data => response.status(200).json(data))
            .catch(err => response.status(400).json({
              status : "error", message: err
            }))
  }
  
  module.exports = { getCarroPorModelo, addCarro, 
    updateCarro, deleteCarro, getCarroPorCodigo }