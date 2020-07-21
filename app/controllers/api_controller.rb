require 'rest-client'

class ApiController < ApplicationController
    skip_before_action :verify_authenticity_token

    def get_equipment_list
        Rails.logger.info '[GET] 127.0.0.1:3005/api/equipment_list'

        ret = RestClient.get '127.0.0.1:3005/api/equipment_list'
        Rails.logger.info ret
        ret = Oj.load(ret).deep_stringify_keys
        Rails.logger.info ret
        render json: Oj.dump(ret)
    end

    def delete_equipment
        Rails.logger.info '[DELETE] 127.0.0.1:3005/api/equipment'
        id = params[:id] || ''

        Rails.logger.info '[DELETE] 127.0.0.1:3005/api/equipment/' + id
        ret = RestClient.delete ('127.0.0.1:3005/api/equipment/' + id)
        Rails.logger.info ret
        ret = Oj.load(ret).deep_stringify_keys
        Rails.logger.info ret
        render json: Oj.dump(ret)
    end 

    def add_equipment
        Rails.logger.info '[POST] 127.0.0.1:3005/api/equipment'
        
        ret = RestClient.post '127.0.0.1:3005/api/equipment', {params: {id: params[:id], name: params[:name], description: params[:description], images: params[:images]}}
        Rails.logger.info ret
        ret = Oj.load(ret).deep_stringify_keys
        Rails.logger.info ret
        render json: Oj.dump(ret)
    end

    def update_equipment
        Rails.logger.info '[PUT] 127.0.0.1:3005/api/equipment/:id'

        ret = RestClient.put ('127.0.0.1:3005/api/equipment/' + params[:id]), {params: {name: params[:name], description: params[:description], images: params[:images]}}
        Rails.logger.info ret
        ret = Oj.load(ret).deep_stringify_keys
        Rails.logger.info ret
        render json: Oj.dump(ret)
    end

    def restful_call method, host, payload, header
        Rails.logger.info '[PUT] 127.0.0.1:3005/api/equipment/:id'

        ret = RestClient.put '127.0.0.1:3005/api/equipment/:id', {params: {id: :id, name: :name, description: :description, images: :images}}
        Rails.logger.info ret
        ret = Oj.load(ret).deep_stringify_keys
        Rails.logger.info ret
        render json: Oj.dump(ret)
    end

    def test
    end

end