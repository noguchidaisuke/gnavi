module ValidateMethods
    extend ActiveSupport::Concern

    included do
    end

    def image_presence
        if images.attached?
            images.each do |image|
                if !image.content_type.in?('image/jpeg', 'image/png')
                    errors.add(:image, '画像はjpegまたはpngファイルのみ有効です')
                end
            end
        end
    end

    def avatar_presence
        if avatar.attached?
            if !avatar.content_type.in?('image/jpeg' 'image/png')
                errors.add(:image, 'はjpegまたはpngファイルのみ有効です')
            end
        end
    end
end




