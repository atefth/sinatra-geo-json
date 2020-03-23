require 'sinatra/activerecord'
require 'byebug'

class Point < ActiveRecord::Base

  def self.within_radius(coordinates, radius)
    x = coordinates[0].to_f
    y = coordinates[1].to_f
    sql = "SELECT
            *
           FROM
            points
           WHERE
            (
              (#{x} - TO_NUMBER((json#>> '{coordinates, 0}'), '99G999D9S'))
                *
              (#{x} - TO_NUMBER((json#>> '{coordinates, 0}'), '99G999D9S'))
            )
              +
            (
              (#{y} - TO_NUMBER((json#>> '{coordinates, 1}'), '99G999D9S'))
                *
              (#{y} - TO_NUMBER((json#>> '{coordinates, 1}'), '99G999D9S'))
            ) <= (#{radius.to_f * radius.to_f})
           ORDER BY created_at ASC;"
    result = ActiveRecord::Base.connection.execute(sql)
    return result.as_json
  end

  def self.within_polygon(coordinates)
    x = coordinates[0].to_f
    y = coordinates[1].to_f
    sql = "SELECT
            *
           FROM
            points
           WHERE
            (
              (#{x} - TO_NUMBER((json#>> '{coordinates, 0}'), '99G999D9S'))
                *
              (#{x} - TO_NUMBER((json#>> '{coordinates, 0}'), '99G999D9S'))
            )
              +
            (
              (#{y} - TO_NUMBER((json#>> '{coordinates, 1}'), '99G999D9S'))
                *
              (#{y} - TO_NUMBER((json#>> '{coordinates, 1}'), '99G999D9S'))
            ) <= (#{radius.to_f * radius.to_f})
           ORDER BY created_at ASC;"
    result = ActiveRecord::Base.connection.execute(sql)
    return result.as_json
  end
end
