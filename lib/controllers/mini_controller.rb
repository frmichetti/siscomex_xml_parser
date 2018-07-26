module Controllers
  module MiniController
    class << self
      def included(controller)

        controller.namespace('/api') {|c|
          c.get('') {
            make_default_json_api(instance: self) {
              {msg: 'Welcome To Dynamic Ruby Class Creator Apis'}
            }
          }

          # <host>/api/tables
          # Show tables
          c.namespace('/tables') {|c|
            c.get('') {
              make_default_json_api(instance: self) {
                {database: App::DATASOURCE.opts[:database], schema: App::ClassMap.first[:schema], tables: App::ClassMap}
              }
            }

            # <host>/api/tables/<table_name>
            # Return rows for table
            c.get('/:table_name') {|table_name|
              make_default_json_api(instance: self, payload: nil, table_name: table_name) {|mapped_class, klass|

                {"#{mapped_class[:table_name]}": klass.all.map(&:values)}
              }
            }

            # <host>/api/tables/<table_name>/<id>
            # Return a row in current table
            c.get('/:table_name/:id') {|table_name, id|
              make_default_json_api(instance: self, payload: nil, table_name: table_name) {|mapped_class, klass|

                {"#{mapped_class[:table_name]}": klass.find_by_id(id)&.values}
              }
            }

            # <host>/api/tables/<table_name>/<page>/<limit>
            # Return a list of current table in pagination mode
            c.get('/:table_name/:page/:limit') {|table_name, page, limit|
              make_default_json_api(instance: self, payload: nil, table_name: table_name) {|mapped_class, klass|

                pagination = {total: klass.count, page: page.to_i, limit: limit.to_i}

                {"#{mapped_class[:table_name]}": klass.dataset.paginate(page.to_i, limit.to_i)}.merge(pagination)
              }
            }


            # <host>/api/tables/<table_name>/<id>
            # Delete a row in current table
            c.delete('/:table_name/:id') {|table_name, id|
              make_default_json_api(instance: self, payload: nil, table_name: table_name) {|_mapped_class, klass|

                klass[id].destroy

                {msg: "#{klass.name} with id: #{id} was success removed."}
              }
            }

            # <host>/api/tables/<table_name>
            # Persist values in current table
            c.post('/:table_name') {|table_name|

              # Lambda Sample for change default error handler
              on_error = ->(exception) {{exception: exception}}

              make_default_json_api(instance: self, payload: request.body.read, table_name: table_name, on_error: on_error) {|params, _status_code, _mapped_class, klass|

                {status: _status_code, response: klass.create(params)&.values}
              }
            }

            # <host>/api/tables/<table_name>/<id>
            # Update values in current table
            c.put('/:table_name/:id') {|table_name, id|
              make_default_json_api(instance: self, payload: request.body.read, table_name: table_name) {|params, _status_code, _mapped_class, klass|

                object = klass[id]
                raise ModelException.new "#{table_name} not found with id: #{id}" unless object

                {status: _status_code, response: object.update(params)&.values}
              }
            }
          }


          controller.namespace('/columns') {|c|
            # <host>/columns/<table_name>
            # Show possible columns in a current table
            c.get('/:table_name') {|table_name|
              make_default_json_api(instance: self, payload: nil, table_name: table_name) {|mapped_class, _klass|

                {"#{mapped_class[:table_name]}": mapped_class[:columns_n_types]}
              }
            }
          }

          controller.namespace('/required') {|c|
            # <host>/required/<table_name>
            # Show required columns in a current table
            c.get('/:table_name') {|table_name|
              make_default_json_api(instance: self, payload: nil, table_name: table_name) {|mapped_class, _klass|

                {"#{mapped_class[:table_name]}": mapped_class[:required]}
              }
            }
          }

          controller.namespace('/optional') {|c|
            # <host>/optional/<table_name>
            # Show optional columns in a current table
            c.get('/:table_name') {|table_name|
              make_default_json_api(instance: self, payload: nil, table_name: table_name) {|mapped_class, _klass|

                {"#{mapped_class[:table_name]}": mapped_class[:optional]}
              }
            }
          }
        }
      end
    end
  end
end