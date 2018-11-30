module ApplicationHelper

  def alert_type(key)
    alert_hash = {
      'notice'  => 'success',
      'alert'   => 'danger'
    }
    alert_hash[key]
  end
end
