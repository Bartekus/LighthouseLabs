module LightBrow
  class Browser

    def run
      welcome
      History.current_history = History.order(created_at: :desc).first
      loop do
        input
        break if quit?
        handle
      end
    end

    private

    def welcome
      menu = <<-menutext
Welcome to Lighthouse Browser - Aka LightBrow
      menutext
      puts menu.colorize(:yellow)
      help
    end

    def help
      help = <<-helptext
COMMANDS:
\\? - help text
\\q - quit
\\h - history
\\b - back
\\f - forward
      helptext
      puts help.colorize(:blue)
    end

    def handle
      if command?
        handle_command
      else
        visit(@input)
      end
    end

    def command?
      @input.start_with? '\\'
    end

    def handle_command
      case @input[0..1]
      when '\\?' then help # \?
      when '\\h' then history # \h
      when '\\b' then back # \b
      when '\\f' then forward # \f
      when '\\v' then link((@input[-1]).to_i)
      end
    end

    def history
      all_history = History.order(created_at: :desc)
      all_history.each do |history| puts "#{history.url}" end
    end

    def forward
      move_forward = History.where("created_at > ?", History.current_history.created_at).order(created_at: :asc).first
      History.current_history = move_forward unless move_forward.nil?
      visit(History.current_history.url, false) unless move_forward.nil?
    end

    def back
      move_back = History.where("created_at < ?", History.current_history.created_at).order(created_at: :desc).first
      History.current_history = move_back unless move_back.nil?
      visit(History.current_history.url, false) unless move_back.nil?
    end

    def link(number)
      new = History.current_history.url.concat(@page.links[number])
      visit(new, true)
    end

    def visit(url, new = true)
      if response = fetch(url, new)
        @page = HTMLPage.new(response.body)
        display
      else
        puts " ! Invalid URL ! ".black.on_red
      end
    end

    def fetch(url, new)
      # return nil if url.match(/^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)\.[a-z]{2,5}(([0-9]{1,5})?\/.)?$/ix).nil?
      return nil if url.match(/^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/).nil?
      puts url
      begin
        uri = URI(url)
        response = Net::HTTP.get_response(uri)
      if new
        History.current_history = History.create(url: url)
      end
      response
      rescue URI::InvalidURIError, URI::InvalidComponentError
        nil
      end
    end

    def display
      print_info "Title", @page.title
      print_info "Description", @page.description
      print_info "Links"
      @page.links.each_with_index do |link, i|
        puts "#{i}. #{link}"
      end
    end

    def menu
      puts "--".colorize(:blue)
      puts "Where to next?"
      print "url> ".colorize(:blue)
    end

    def input
      menu
      @input = gets.chomp
    end

    def quit?
      @input == '\q'
    end

    def print_info(label, value=nil)
      print "#{label}: ".colorize(:red)
      puts value
    end
  end
end
